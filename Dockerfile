FROM buildpack-deps:jessie-curl

ENV KAPACITOR_VERSION 0.12.0
RUN wget -s -o /tmp/kapacitator_latest_amd64.deb https://s3.amazonaws.com/kapacitor/kapacitor_$KAPACITOR_VERSION-1_amd64.deb && \
    dpkg -i /tmp/kapacitor_latest_amd64.deb && \
    rm /tmp/kapacitor_latest_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 9092

COPY run.sh /run.sh
CMD ["/run.sh"]
