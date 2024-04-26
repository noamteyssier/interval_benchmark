sample:
    just run_sample_bedtools;
    just run_sample_gia;

run_sample_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/sample_bedtools.csv" \
        "bedtools sample -i {{BED_LARGE}} -n {{SAMPLE_SIZE}} > /dev/null";

run_sample_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/sample_gia.csv" \
        "gia sample -i {{BED_LARGE}} -n {{SAMPLE_SIZE}} > /dev/null";
