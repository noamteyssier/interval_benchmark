closest:
    just run_closest_bedtools;
    just run_closest_gia;

closest_stranded:
    just run_closest_bedtools_stranded;
    just run_closest_gia_stranded;

run_closest_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/closest_bedtools.csv" \
        "bedtools closest -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_closest_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/closest_gia.csv" \
        "gia closest -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_closest_bedtools_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/closest_bedtools_stranded.csv" \
      "bedtools closest -a {{STRANDED_A}} -b {{STRANDED_B}} -s > /dev/null";

run_closest_gia_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/closest_gia_stranded.csv" \
      "gia closest -a {{STRANDED_A}} -b {{STRANDED_B}} -sm > /dev/null";
