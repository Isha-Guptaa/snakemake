samples= {"father","mother","proband"}
rule bwa_map:
    input:
        "data/genome.fa",
        "data/samples/{sample}_R1.fq",
        "data/samples/{sample}_R2.fq"
    output:
        "mapped/{sample}.bam"
    shell:
        "bwa mem {input} | samtools view -Shb -o {output}"
rule sort:
    input:
        "mapped/{sample}.bam"
    output:
        "sorted_reads/{sample}.sorted.bam"
    shell:
        "samtools sort -o {output} {input}"
rule samtools_index:
    input:
        "sorted_reads/{sample}.sorted.bam"
    output:
        "sorted_reads/{sample}.bam.bai"
    shell:
        "samtools index {input} > {output}"
rule all:
    input:
        expand("mapped/{sample}.bam",sample=samples)
rule genomic_variants:
    input:
        genome="data/genome.fa",
        bam=expand("sorted_reads/{sample}.sorted.bam", sample=samples),
        bai=expand("sorted_reads/{sample}.bam.bai", sample=samples)
    output:
        "calls/all.avf"
    shell:
        "bcftools mpileup -f {input.genome} {input.bam} | "
        "bcftools call -mv - > {output}"
rule plot_quals:
    input:
        "calls/all.avf"
    output:
        "plots/quals.svg"
    script:
        "plot-quals.py"