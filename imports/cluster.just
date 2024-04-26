cluster:
    just run_cluster_bedtools;
    just run_cluster_gia;

run_cluster_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/cluster_bedtools.csv" \
        "bedtools cluster -i {{BED_LARGE}} > /dev/null";

run_cluster_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/cluster_gia.csv" \
        "gia cluster -i {{BED_LARGE}} > /dev/null";
