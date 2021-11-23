FROM ubuntu

RUN apt-get update \
    && apt-get install -y wget git krb5-user \
        build-essential libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev \
    && apt-get clean

# conda
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /usr/src/miniconda3 \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 
ENV PATH=${PATH}:/usr/src/miniconda3/bin
ENV LD_LIBRARY_PATH=/usr/src/miniconda3/lib

RUN conda config --add channels bioconda \
	&& conda install -c conda-forge mamba
RUN pip install snakemake

WORKDIR /
RUN git clone https://github.com/comprna/METEORE.git
WORKDIR /METEORE
RUN conda init bash
RUN . /usr/src/miniconda3/etc/profile.d/conda.sh
