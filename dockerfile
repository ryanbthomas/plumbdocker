FROM rocker/r-base

RUN apt-get update -qq && apt-get install -y \
	libssl-dev \
	libcurl4-gnutls-dev

# install R package
ENV RENV_VERSION 0.10.0-26
RUN R -e "install.packages('remotes')"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

COPY plumbpkg /tmp/plumbpkg
RUN R -e "options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/__linux__/bionic/latest')) \
	renv::install('/tmp/plumbpkg')"

COPY start_api.R /start_api.R

EXPOSE 8000

# set entry point
ENTRYPOINT ["Rscript", "start_api.R"] 
