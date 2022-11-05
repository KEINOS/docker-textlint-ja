FROM textlint/textlint:local

USER root

RUN \
    cd /tmp && \
    wget -O- https://git.io/shellspec | sh -s -- --prefix /usr/local/bin --yes && \
    ln -s /usr/local/bin/lib/shellspec/shellspec /usr/local/bin/shellspec

USER textlint

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/shellspec"]
