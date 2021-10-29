FROM rocker/verse
COPY . .
MAINTAINER Kaitlyn Cross <kcross@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'shiny'))"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN adduser rstudio sudo
RUN apt update -y && apt install -y\
	texlive-base\
	texlive-binaries\
        texlive-latex-base\
	texlive-latex-recommended\
	texlive-pictures\
        texlive-latex-extra\

