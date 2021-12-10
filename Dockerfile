FROM rocker/verse
MAINTAINER Kaitlyn Cross <kcross@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'shiny', 'stringr', 'GGally', 'egg', 'ggstatsplot', 'ggpubr', 'ggside'))"
#install tinytex
#RUN R -e ""

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN adduser rstudio sudo
RUN apt update -y && apt install -y\
	texlive-base\
	texlive-binaries\
        texlive-latex-base\
	texlive-latex-recommended\
	texlive-pictures\
        texlive-latex-extra

