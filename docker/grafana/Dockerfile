FROM grafana/grafana:10.2.0

# Configurazioni di base
ENV GF_SERVER_HTTP_PORT "3001"
ENV GF_AUTH_DISABLE_LOGIN_FORM "true"
ENV GF_AUTH_ANONYMOUS_ENABLED "true"
ENV GF_AUTH_ANONYMOUS_ORG_ROLE "Admin"
ENV GF_PATHS_PROVISIONING "/etc/grafana/provisioning"
ENV GF_DATASOURCES_ALLOW_INVALID_CERTS "true"
ENV GF_SECURITY_ALLOW_EMBEDDING "true"
ENV GF_SECURITY_COOKIE_SAMESITE "none"
ENV GF_SECURITY_CORS_ENABLED "true"
ENV GF_SECURITY_CORS_ALLOW_ORIGIN "*"

# Crea la directory per il provisioning
RUN mkdir -p /etc/grafana/provisioning/datasources/

# Aggiungi la configurazione del datasource
COPY datasources.yaml /etc/grafana/provisioning/datasources/