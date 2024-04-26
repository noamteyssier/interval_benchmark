subtract:
    just run_subtract_inplace_bedtools;
    just run_subtract_inplace_gia;
    just run_subtract_stream_bedops;

subtract_stranded:
    just run_subtract_bedtools_stranded;
    just run_subtract_gia_stranded;

run_subtract_inplace_bedtools:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/subtract_bedtools.csv" \
        "bedtools subtract -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_subtract_inplace_gia:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/subtract_gia.csv" \
        "gia subtract -a {{SORTED_A}} -b {{SORTED_B}} > /dev/null";

run_subtract_stream_bedops:
    {{HYPERFINE}} \
        --export-csv "{{RESULTS_DIR}}/subtract_bedops.csv" \
        "bedops -i {{SORTED_A}} {{SORTED_B}} > /dev/null";

run_subtract_bedtools_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/subtract_bedtools_stranded.csv" \
      "bedtools subtract -a {{STRANDED_A}} -b {{STRANDED_B}} -s > /dev/null";

run_subtract_gia_stranded:
    {{HYPERFINE}} \
      --export-csv "{{RESULTS_DIR}}/subtract_gia_stranded.csv" \
      "gia subtract -a {{STRANDED_A}} -b {{STRANDED_B}} -sm > /dev/null";
