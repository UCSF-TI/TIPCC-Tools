# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Programming languages
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
prependPath ${SHARED_SOFTWARE}/valgrind-latest/coregrind
prependPath ${SHARED_SOFTWARE}/jdk-latest/bin
prependPath ${SHARED_SOFTWARE}/matlab-latest/bin
prependPath ${SHARED_SOFTWARE}/R-latest/bin

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: Containers
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
prependPath ${SHARED_SOFTWARE}/udocker-latest


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SOFTWARE: HT-Seq
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
prependPath ${SHARED_SOFTWARE}/BamUtil-latest/bamUtil/bin
prependPath ${SHARED_SOFTWARE}/bedops-latest/bin
prependPath ${SHARED_SOFTWARE}/bedtools2-latest/bin
prependPath ${SHARED_SOFTWARE}/blast-latest
prependPath ${SHARED_SOFTWARE}/bowtie2-latest
prependPath ${SHARED_SOFTWARE}/bwa-latest
prependPath ${SHARED_SOFTWARE}/Control-FREEC-latest/bin
prependPath ${SHARED_SOFTWARE}/cufflinks-latest
prependPath ${SHARED_SOFTWARE}/FastQC-latest
prependPath ${SHARED_SOFTWARE}/GeneTorrent-latest/bin
prependManPath ${SHARED_SOFTWARE}/GeneTorrent-latest/share/man
prependPath ${SHARED_SOFTWARE}/HTSeq-latest/scripts
prependPath ${SHARED_SOFTWARE}/sratoolkit-latest/bin
prependPath ${SHARED_SOFTWARE}/samtools-latest
prependPath ${SHARED_SOFTWARE}/bcftools-latest
prependPath ${SHARED_SOFTWARE}/tophat-latest
prependPath ${SHARED_SOFTWARE}/vcftools-latest/bin
prependPath ${SHARED_SOFTWARE}/wordspy-latest
prependPath ${SHARED_SOFTWARE}/IGVTools-latest
prependPath ${SHARED_SOFTWARE}/IGV-latest

alias igv=${SHARED_SOFTWARE}/IGV-latest/igv.sh
export PICARD_HOME=${SHARED_SOFTWARE}/picard-tools-latest
export GATK_HOME=${SHARED_SOFTWARE}/GATK-latest

prependPath ${SHARED_SOFTWARE}/htslib-latest/bin
export HTSLIB_HOME=/home/shared/cbc/software/htslib-latest
