FROM python:3.11.4
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/opt/bin:$PATH


ADD install_packages_R.R /tmp/
ADD requirements.txt /tmp/
ADD exportVersion /opt/bin/
ADD https://github.com/arq5x/bedtools2/releases/download/v2.31.0/bedtools.static /opt/bin/bedtools
RUN pip3 install nbdev jupyter --no-cache-dir && \
    pip3 install -r /tmp/requirements.txt --no-cache-dir && \
    chmod +x /opt/bin/* && \
    apt autoremove && \
    apt clean && \
    apt autoclean && \
    rm -rf /tmp/*


