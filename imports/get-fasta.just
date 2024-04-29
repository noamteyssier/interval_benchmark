
get-fasta: run_get-fasta_bedtools run_get-fasta_gia run_get-fasta_gia_gzip

get-fasta-stranded: run_get-fasta_bedtools_stranded run_get-fasta_gia_stranded

run_get-fasta_bedtools:
  {{HYPERFINE}} \
    --export-csv "{{RESULTS_DIR}}/get-fasta_bedtools.csv" \
    "bedtools getfasta -fi {{FASTA}} -bed {{SORTED_A}} > /dev/null"

run_get-fasta_gia:
  {{HYPERFINE}} \
    --export-csv "{{RESULTS_DIR}}/get-fasta_gia.csv" \
    "gia get-fasta -f {{FASTA}} -i {{SORTED_A}} > /dev/null"

run_get-fasta_gia_gzip:
  {{HYPERFINE}} \
    --export-csv "{{RESULTS_DIR}}/get-fasta_gia_gzip.csv" \
    "gia get-fasta -f {{GZFASTA}} -i {{SORTED_A}} > /dev/null"

run_get-fasta_bedtools_stranded:
  {{HYPERFINE}} \
    --export-csv "{{RESULTS_DIR}}/get-fasta_bedtools_stranded.csv" \
    "bedtools getfasta -fi {{FASTA}} -bed {{SORTED_A}} -s > /dev/null"

run_get-fasta_gia_stranded:
  {{HYPERFINE}} \
    --export-csv "{{RESULTS_DIR}}/get-fasta_gia_stranded.csv" \
    "gia get-fasta -f {{FASTA}} -i {{SORTED_A}} -s > /dev/null"
