FROM bioconductor/bioconductor_docker:devel

WORKDIR /home/rstudio


RUN Rscript -e "options(repos = c(CRAN = 'https://cran.r-project.org')); BiocManager::install('IRkernel')"
RUN pip3 install jupyterlab
RUN pip3 install jupytext

RUN Rscript -e "IRkernel::installspec(user = FALSE)"

CMD ["jupyter", "lab", "--allow-root", "--ip=0.0.0.0", "--port=8787", "--LabApp.token=''"]
