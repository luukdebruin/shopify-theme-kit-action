FROM alpine:3.11

RUN apk update

# https://shopify.github.io/themekit/
RUN apk add --no-cache python ca-certificates curl && \
    curl -s https://shopify.github.io/themekit/scripts/install.py | python && \
    apk del curl

# https://help.github.com/en/actions/building-actions/creating-a-docker-container-action
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
