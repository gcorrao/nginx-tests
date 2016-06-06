FROM ubuntu:16.04
RUN apt-get --yes update && apt-get --yes install dnsmasq
RUN echo "user=root" >> /etc/dnsmasq.conf
CMD ["dnsmasq","--keep-in-foreground","--log-queries"]
