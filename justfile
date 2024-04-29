import 'imports/bam.just'
import 'imports/closest.just'
import 'imports/cluster.just'
import 'imports/complement.just'
import 'imports/coverage.just'
import 'imports/extend.just'
import 'imports/flank.just'
import 'imports/get-fasta.just'
import 'imports/merge.just'
import 'imports/random.just'
import 'imports/sample.just'
import 'imports/shift.just'
import 'imports/sort.just'
import 'imports/spacing.just'
import 'imports/intersect.just'
import 'imports/subtract.just'
import 'imports/unionbedg.just'
import 'imports/window.just'
import 'imports/generate.just'

HYPERFINE := "hyperfine --warmup 10 -u millisecond"
RESULTS_DIR := "results"

BED_A := "data/a.bed"
BED_B := "data/b.bed"
BEDGRAPH_A := "data/a.bedgraph"
BEDGRAPH_B := "data/b.bedgraph"
BEDGRAPH_C := "data/c.bedgraph"
SORTED_A := "data/a.sorted.bed"
SORTED_B := "data/b.sorted.bed"
STRANDED_A := "data/a.stranded.bed"
STRANDED_B := "data/b.stranded.bed"
BED_LARGE := "data/large.bed"
BED6_LARGE := "data/large_stranded.bed"
GENOME := "data/genome.txt"
BAM := "data/subsample.bam"
BAM_FILTER := "data/filter.bed"
FASTA := "data/Homo_sapiens.GRCh38.dna.primary_assembly.fa"
GZFASTA := "data/Homo_sapiens.GRCh38.dna.primary_assembly.fa.gz"

MAX_CHROMOSOME_LEN := "100000000"
NUM_INTERVALS := "2000000"
NUM_INTERVALS_LARGE := "5000000"
NUM_CHROMOSOMES := "20"
INTERVAL_SIZE := "1000"
EXTEND_SIZE := "1000"
SAMPLE_SIZE := "1000000"

benchmark: closest cluster complement coverage extend flank intersect merge random sample shift sort spacing subtract unionbedg window get-fasta

benchmark_stranded: closest_stranded coverage_stranded extend_stranded flank_stranded intersect_stranded merge_stranded subtract_stranded window_stranded get-fasta-stranded

gen: gen_data gen_sorted_data gen_stranded_sorted_data gen_data_large gen_genome gen_sorted_data_matrix gen_sorted_data_matrix_high gen_bedgraphs gen_data_large_stranded
