bam: bam_convert bam_filter bam_coverage

bam_convert: run_bam_convert_bedtools run_bam_convert_gia run_bam_convert_gia_mt

bam_filter: run_bam_filter_bedtools run_bam_filter_gia run_bam_filter_gia_mt

bam_coverage: run_bam_coverage_bedtools run_bam_coverage_gia run_bam_coverage_gia_mt

run_bam_convert_bedtools:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_convert_bedtools.csv" \
      "bedtools bamtobed -i {{BAM}} > /dev/null"

run_bam_convert_gia:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_convert_gia.csv" \
      "gia bam convert -i {{BAM}} > /dev/null"

run_bam_convert_gia_mt:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_convert_gia_mt.csv" \
      "gia bam convert -i {{BAM}} -t 12 > /dev/null"

run_bam_filter_bedtools:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_filter_bedtools.csv" \
      "bedtools intersect -a {{BAM}} -b {{BAM_FILTER}} -u > /dev/null"

run_bam_filter_gia:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_filter_gia.csv" \
      "gia bam filter -a {{BAM}} -b {{BAM_FILTER}} > /dev/null"

run_bam_filter_gia_mt:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_filter_gia_mt.csv" \
      "gia bam filter -a {{BAM}} -b {{BAM_FILTER}} -t 12 > /dev/null"

run_bam_coverage_bedtools:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_coverage_bedtools.csv" \
      "bedtools coverage -a {{BAM_FILTER}} -b {{BAM}} -counts > /dev/null"

run_bam_coverage_gia:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_coverage_gia.csv" \
      "gia bam coverage -a {{BAM}} -b {{BAM_FILTER}} > /dev/null"

run_bam_coverage_gia_mt:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/bam_coverage_gia_mt.csv" \
      "gia bam coverage -a {{BAM}} -b {{BAM_FILTER}} -t 12 > /dev/null"

