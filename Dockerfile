FROM alpine:3.7

ENV HOST HOSTNAME

LABEL tags="latest 1.0.3" \
      build_ver="10-10-2018"

RUN apk -U upgrade \
    && apk add -U --no-cache openssl util-linux strongswan bash \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

ADD ./etc/* /etc/
ADD ./bin/* /usr/bin/

EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn

