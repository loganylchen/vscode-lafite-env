FROM btrspg/vscode-base:0.0.4

ADD install_packages_R.R /tmp/
ADD requirements.txt /tmp/
ADD exportVersion /opt/bin/

RUN pip3 install -r /tmp/requirements.txt --no-cache-dir && \
    Rscript /tmp/install_packages_R.R && \
    chmod +x /opt/bin/exportVersion && \
    apt autoremove && \
    apt clean && \
    apt autoclean && \
    rm -rf /tmp/*
