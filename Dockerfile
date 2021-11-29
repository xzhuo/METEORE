FROM continuumio/miniconda3

RUN apt-get update \
    && apt-get install -y build-essential \
       libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev \
    && apt-get clean

# conda
# RUN conda config --add channels bioconda \
RUN conda install -c conda-forge mamba
# RUN pip install snakemake

WORKDIR /
RUN git clone https://github.com/comprna/METEORE.git
WORKDIR /METEORE
RUN conda init bash
RUN . /opt/conda/etc/profile.d/conda.sh

WORKDIR /
RUN git clone https://github.com/kpalin/gcf52ref.git
WORKDIR /gcf52ref

#guppy
# RUN sed -i 's/r-data.table=1.13.0=r36h0eb13af_0/r-data.table/;s/r-dplyr=1.0.2=r36h0357c0b_0/r-dplyr/;s/r-plyr=1.8.6=r36h0357c0b_1/r-plyr/' guppy.yml
# RUN mamba env create -f guppy.yml
# RUN conda activate guppy_cpg_snakemake
