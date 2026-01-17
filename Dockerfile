FROM quay.io/keycloak/keycloak:26.5.1

# Copy any custom configurations if needed
# COPY config/ /opt/keycloak/conf/

# The image will be run with start command via K8s deployment
