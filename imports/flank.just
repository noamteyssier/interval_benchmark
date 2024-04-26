flank:
    just run_flank_bedtools;
    just run_flank_gia;

flank_stranded:
    just run_flank_bedtools_stranded;
    just run_flank_gia_stranded;

run_flank_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/flank_bedtools.csv" \
        "bedtools flank -i {{BED_LARGE}} -g {{GENOME}} -b {{EXTEND_SIZE}} > /dev/null";

run_flank_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/flank_gia.csv" \
        "gia flank -i {{BED_LARGE}} -t {{EXTEND_SIZE}} > /dev/null";

run_flank_bedtools_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/flank_bedtools_stranded.csv" \
        "bedtools flank -i {{BED6_LARGE}} -g {{GENOME}} -b {{EXTEND_SIZE}} -s > /dev/null";

run_flank_gia_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/flank_gia_stranded.csv" \
        "gia flank -i {{BED6_LARGE}} -t {{EXTEND_SIZE}} -s > /dev/null";
