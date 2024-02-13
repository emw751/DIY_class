for FASTQ in *fastq*
do
	OUT=${FASTQ//.fastq.gz/_mapped}
	LOG=${FASTQ//.fastq.gz/_mapped.log}
	fastqc $FASTQ
	kallisto quant -i Homo_sapiens.GRCh38.cdna.all.index -o $OUT --single -l 250 -s 30 $FASTQ -t 8 &> $LOG
done
multiqc -d .