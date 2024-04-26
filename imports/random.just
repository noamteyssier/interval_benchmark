NUM_SAMPLES := "100"
SIZES := "1000 10000 100000 1000000 10000000"

random: 
  for i in {{SIZES}}; do \
    just NUM_SAMPLES=${i} run_random_bedtools; \
    just NUM_SAMPLES=${i} run_random_gia; \
  done

run_random_bedtools: 
   {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/random_bedtools_{{NUM_SAMPLES}}.csv" \
      "bedtools random -n {{NUM_SAMPLES}} -g {{GENOME}} > /dev/null"

run_random_gia: 
   {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/random_gia_{{NUM_SAMPLES}}.csv" \
      "gia random -n {{NUM_SAMPLES}} -g {{GENOME}} > /dev/null"
