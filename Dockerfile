FROM quay.io/keycloak/keycloak:26.1.3 AS builder

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:26.1.3
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENV KC_PROXY=edge
ENV KC_HTTP_PORT=8080
ENV KC_HTTP_ENABLED=true
ENV KC_PROXY-HEADERS=xforwarded
ENV KC_HOSTNAME-STRICT=false

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]