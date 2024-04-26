sort:
    just run_sort_bedtools;
    just run_sort_gia;
    just run_sort_bedops;

run_sort_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/sort_bedtools.csv" \
        "bedtools sort -i {{BED_LARGE}} > /dev/null";

run_sort_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/sort_gia.csv" \
        "gia sort -i {{BED_LARGE}} > /dev/null";

run_sort_bedops:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/sort_bedops.csv" \
        "sort-bed {{BED_LARGE}} > /dev/null";
