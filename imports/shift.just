shift:
    just run_shift_bedtools;
    just run_shift_gia;

run_shift_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/shift_bedtools.csv" \
        "bedtools shift -i {{BED_LARGE}} -g {{GENOME}} -s {{EXTEND_SIZE}} > /dev/null";

run_shift_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/shift_gia.csv" \
        "gia shift -i {{BED_LARGE}} -a {{EXTEND_SIZE}} > /dev/null";
