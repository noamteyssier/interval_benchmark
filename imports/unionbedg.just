unionbedg:
    just run_unionbedg_bedtools;
    just run_unionbedg_gia;

run_unionbedg_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/unionbedg_bedtools.csv" \
        "bedtools unionbedg -i {{BEDGRAPH_A}} {{BEDGRAPH_B}} {{BEDGRAPH_C}} > /dev/null";

run_unionbedg_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/unionbedg_gia.csv" \
        "gia unionbedg -i {{BEDGRAPH_A}} {{BEDGRAPH_B}} {{BEDGRAPH_C}} > /dev/null";
