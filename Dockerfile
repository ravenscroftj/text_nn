FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu14.04-devel

RUN apt update && apt install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x Miniconda3-latest-Linux-x86_64.sh \
    && ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda

ENV PATH=/opt/miniconda/bin/:$PATH

RUN conda create -n textnn -c pytorch -c conda-forge pytorch=0.3.0 torchvision scikit-learn scipy pydot matplotlib tqdm twilio

ENV PATH=/opt/miniconda/envs/textnn/bin/:$PATH

WORKDIR  /app

ADD . /app

ENV LANG C.UTF-8