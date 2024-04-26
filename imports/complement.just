complement:
    just run_complement_bedtools;
    just run_complement_gia;

run_complement_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/complement_bedtools.csv" \
        "bedtools complement -i {{BED_LARGE}} -g {{GENOME}} > /dev/null";

run_complement_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/complement_gia.csv" \
        "gia complement -i {{BED_LARGE}} > /dev/null";
