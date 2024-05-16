FROM mcr.microsoft.com/powershell:lts-7.2-ubuntu-20.04
COPY . /
RUN pwsh /Generate-CSVExport.ps1
ENTRYPOINT [ "/docker-entrypoint.sh" ]