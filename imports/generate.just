gen_data:
  gia random -n {{NUM_INTERVALS}} -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -o {{BED_A}} -s 0
  gia random -n {{NUM_INTERVALS}} -l 500 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -o {{BED_B}} -s 1

gen_sorted_data:
  gia random -n {{NUM_INTERVALS}} -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 3 | \
    gia sort -o {{SORTED_A}}
  gia random -n {{NUM_INTERVALS}} -l 500 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 4 | \
    gia sort -o {{SORTED_B}}

gen_stranded_sorted_data:
  gia random -n {{NUM_INTERVALS}} -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 3 -T bed6 | \
    gia sort -o {{STRANDED_A}}
  gia random -n {{NUM_INTERVALS}} -l 500 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 4 -T bed6 | \
    gia sort -o {{STRANDED_B}}

gen_data_large:
  gia random -n {{NUM_INTERVALS_LARGE}} -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 2 | \
  gia sort -o {{BED_LARGE}}

gen_data_large_stranded:
  gia random -n {{NUM_INTERVALS_LARGE}} -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 2 -T bed6 | \
  gia sort -o {{BED6_LARGE}}

gen_bedgraphs: gen_data_large
  cut -f 1 {{BED_LARGE}} | shuf | paste {{BED_LARGE}} - > {{BEDGRAPH_A}}
  cut -f 1 {{BED_LARGE}} | shuf | paste {{BED_LARGE}} - > {{BEDGRAPH_B}}
  cut -f 1 {{BED_LARGE}} | shuf | paste {{BED_LARGE}} - > {{BEDGRAPH_C}}

gen_genome: gen_data_large
  for i in $(seq 1 {{NUM_CHROMOSOMES}}); do \
    echo $i $(echo "{{MAX_CHROMOSOME_LEN}}+{{EXTEND_SIZE}}+1" | bc); \
  done | \
    tr " " "\t" > {{GENOME}}  

gen_sorted_data_matrix:
  for i in 100 250 500 1000 2500 5000 10000 25000 50000 100000 250000 500000 750000 1000000 2500000 5000000 10000000; do \
    gia random -n $i -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 0 | \
      gia sort -o data/random_a_${i}.bed; \
    gia random -n $i -l 500 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 1 | \
      gia sort -o data/random_b_${i}.bed; \
  done
  
gen_sorted_data_matrix_high:
  for i in 10 25 50 75; do \
    for j in 10 100 1000 10000 100000 1000000; do \
      num=$(echo $i*$j | bc); \
      gia random -n $num -l 250 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 0 | \
        gia sort -o data/random_a_${num}.bed; \
      gia random -n $num -l 500 -c {{NUM_CHROMOSOMES}} -m {{MAX_CHROMOSOME_LEN}} -s 1 | \
        gia sort -o data/random_b_${num}.bed; \
    done \
  done
