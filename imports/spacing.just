spacing:
    just run_spacing_bedtools;
    just run_spacing_gia;

run_spacing_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/spacing_bedtools.csv" \
        "bedtools spacing -i {{BED_LARGE}} > /dev/null";

run_spacing_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/spacing_gia.csv" \
        "gia spacing -i {{BED_LARGE}} > /dev/null";
