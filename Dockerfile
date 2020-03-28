FROM centos:7.7.1908

ARG TRAEFIK_VERSION="2.2.0"

COPY entrypoint.sh /entrypoint.sh

RUN curl -sL https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz -o /tmp/traefik.tar.gz && \
	tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik && \
	rm -f /tmp/traefik.tar.gz && \
	chmod +x /usr/local/bin/traefik

EXPOSE 80
EXPOSE 8080
EXPOSE 443

ENTRYPOINT [ "bash", "/entrypoint.sh" ]
CMD [ "traefik" ]
