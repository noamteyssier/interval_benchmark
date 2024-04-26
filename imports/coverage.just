coverage:
    just run_coverage_bedtools;
    just run_coverage_gia;

coverage_stranded:
    just run_coverage_bedtools_stranded;
    just run_coverage_gia_stranded;

run_coverage_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/coverage_bedtools.csv" \
        "bedtools coverage -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_coverage_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/coverage_gia.csv" \
        "gia coverage -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_coverage_bedtools_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/coverage_bedtools_stranded.csv" \
      "bedtools coverage -a {{STRANDED_A}} -b {{STRANDED_B}} -s > /dev/null";

run_coverage_gia_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/coverage_gia_stranded.csv" \
      "gia coverage -a {{STRANDED_A}} -b {{STRANDED_B}} -sm > /dev/null";
