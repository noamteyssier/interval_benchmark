window:
    just run_window_bedtools;
    just run_window_gia;

window_stranded:
    just run_window_bedtools_stranded;
    just run_window_gia_stranded;

run_window_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/window_bedtools.csv" \
        "bedtools window -a {{SORTED_A}} -b {{SORTED_B}} -w {{EXTEND_SIZE}} > /dev/null";

run_window_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/window_gia.csv" \
        "gia window -a {{SORTED_A}} -b {{SORTED_B}} -t {{EXTEND_SIZE}} > /dev/null";

run_window_bedtools_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/window_bedtools_stranded.csv" \
        "bedtools window -a {{STRANDED_A}} -b {{STRANDED_B}} -w {{EXTEND_SIZE}} -sm > /dev/null";

run_window_gia_stranded:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/window_gia_stranded.csv" \
        "gia window -a {{STRANDED_A}} -b {{STRANDED_B}} -t {{EXTEND_SIZE}} -s > /dev/null";
