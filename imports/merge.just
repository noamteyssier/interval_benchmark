merge:
    just run_merge_bedtools;
    just run_merge_gia;
    just run_merge_bedops;

merge_stranded:
    just run_merge_bedtools_stranded;
    just run_merge_gia_stranded;

run_merge_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/merge_bedtools.csv" \
        "bedtools merge -i {{BED_LARGE}} > /dev/null";

run_merge_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/merge_gia.csv" \
        "gia merge -i {{BED_LARGE}} > /dev/null";

run_merge_bedops:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/merge_bedops.csv" \
        "bedops -m {{BED_LARGE}} > /dev/null";

run_merge_bedtools_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/merge_bedtools_stranded.csv" \
      "bedtools merge -i {{BED6_LARGE}} -s > /dev/null";

run_merge_gia_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/merge_gia_stranded.csv" \
      "gia merge -i {{BED6_LARGE}} -r > /dev/null";
