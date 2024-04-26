extend:
    just run_extend_bedtools;
    just run_extend_gia;
    just run_extend_bedops;

extend_stranded:
    just run_extend_bedtools_stranded;
    just run_extend_gia_stranded;

run_extend_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/extend_bedtools.csv" \
        "bedtools slop -i {{BED_LARGE}} -g {{GENOME}} -b {{EXTEND_SIZE}} > /dev/null";

run_extend_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/extend_gia.csv" \
        "gia extend -i {{BED_LARGE}} -t {{EXTEND_SIZE}} > /dev/null";

run_extend_bedops:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/extend_bedops.csv" \
        "bedops -u --range {{EXTEND_SIZE}}:{{EXTEND_SIZE}} {{BED_LARGE}} > /dev/null";

run_extend_bedtools_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/extend_bedtools_stranded.csv" \
        "bedtools slop -i {{BED6_LARGE}} -g {{GENOME}} -b {{EXTEND_SIZE}} -s > /dev/null";

run_extend_gia_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/extend_gia_stranded.csv" \
        "gia extend -i {{BED6_LARGE}} -t {{EXTEND_SIZE}} -s > /dev/null";
