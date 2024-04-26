
intersect:
    just intersect_inplace;
    just intersect_stream;

intersect_inplace:
    just run_intersect_inplace_bedtools;
    just run_intersect_inplace_gia;

intersect_stream:
    just run_intersect_stream_bedtools;
    just run_intersect_stream_gia;
    just run_intersect_stream_bedops;

intersect_stranded:
    just run_intersect_bedtools_stranded;
    just run_intersect_gia_stranded;

run_intersect_inplace_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/intersect_bedtools.csv" \
        "bedtools intersect -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_intersect_inplace_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/intersect_gia.csv" \
        "gia intersect -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_intersect_stream_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/intersect_stream_bedtools.csv" \
        "bedtools intersect -a {{SORTED_A}} -b {{SORTED_B}} -sorted > /dev/null";

run_intersect_stream_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/intersect_stream_gia.csv" \
        "gia intersect -a {{SORTED_A}} -b {{SORTED_B}} --stream > /dev/null";

run_intersect_stream_bedops:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/intersect_stream_bedops.csv" \
        "bedops -i {{SORTED_A}} {{SORTED_B}} > /dev/null";

run_intersect_bedtools_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/intersect_bedtools_stranded.csv" \
      "bedtools intersect -a {{STRANDED_A}} -b {{STRANDED_B}} -s > /dev/null";

run_intersect_gia_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/intersect_gia_stranded.csv" \
      "gia intersect -a {{STRANDED_A}} -b {{STRANDED_B}} -sm > /dev/null";
