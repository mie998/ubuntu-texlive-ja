FROM ubuntu:20.04

MAINTAINER Keisuke Nishiwaki
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    xdvik-ja \ 
    evince \
    texlive-lang-cjk \
    latexmk \
    language-pack-ja \
    wget \
    xzdec \
    texlive-latex-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN tlmgr init-usertree
RUN kanji-config-updmap-sys ipaex

WORKDIR /workdir

VOLUME ["/workdir"]

CMD ["bash"]
