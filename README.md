#Snakemake Pipeline with Conda Dependency Management
<br>
<br>
This README provides instructions for setting up and running a Snakemake pipeline that manages dependencies directly using Conda without relying on a YAML configuration file.
<br>
<br>
## Input Files
<br>
Download the input files from the following Google Drive link:
<br>
[Google Drive Link](https://drive.google.com/drive/folders/1TMusph7hYywcJTDtQOkSyk9LE_9veRWb?usp=drive_link)
<br>
<br>
## Anaconda Setup on Linux
<br>
1. **Download Anaconda installer:**
<br>
wget https://repo.anaconda.com/archive/Anaconda3-2023.03-Linux-x86_64.sh
<br>
<br>
2. **Make the installer executable:**
<br>
chmod +x Anaconda3-2023.03-Linux-x86_64.sh
<br>
<br>
3. **Run the installer:**
<br>
./Anaconda3-2023.03-Linux-x86_64.sh
<br>
<br>
4. **Update your PATH:**
<br>
export PATH="<path_to_anaconda>:$PATH"
<br>
source ~/.bashrc
<br>
<br>
## Snakemake Setup Using Mamba
<br>
1. **Install Mamba in the base environment:**
<br>
conda install -n base -c conda-forge mamba
<br>
<br>
2. **Create a new environment for Snakemake:**
<br>
mamba create -c conda-forge -c bioconda -n snakemake snakemake
<br>
<br>
3. **Activate the Snakemake environment:**
<br>
conda activate snakemake
<br>
<br>
4. **Display Snakemake help:**
<br>
snakemake --help
<br>
<br>
## Install Bioinformatics Tools
<br>
1. **Install BWA:**
<br>
conda install -c bioconda bwa
<br>
<br>
2. **Install Samtools:**
<br>
conda install -c bioconda samtools
<br>
<br>
3. **Install Bcftools:**
<br>
conda install -c bioconda bcftools
<br>
<br>
4. **Install Matplotlib:**
<br>
conda install -c conda-forge matplotlib
<br>
<br>
5. **Install Python 3.8 and Pysam:**
<br>
conda install -c conda-forge python=3.8 pysam=0.16.0.1
<br>
<br>
## Running the Snakemake Pipeline
<br>
Once the paths to all input files are set in the Snakemake file, you can run the pipeline with the following command:
<br>
snakemake --cores 1 -p plots/quals.svg
<br>
<br>
## Visualizing the Directed Acyclic Graph (DAG) of Jobs
<br>
1. **Update package lists and install Graphviz:**
<br>
sudo apt update
<br>
sudo apt install graphviz
<br>
<br>
2. **Generate and visualize the DAG:**
<br>
snakemake --dag calls/all.vcf | dot -Tsvg > workflow.svg
<br>
<br>
