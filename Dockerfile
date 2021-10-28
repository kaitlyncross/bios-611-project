FROM rocker/verse
MAINTAINER Kaitlyn Cross <kcross@unc.edu>
RUN R -e "install.packages(c('ggplot2', 'readr', 'tidyverse', 'shiny'))"