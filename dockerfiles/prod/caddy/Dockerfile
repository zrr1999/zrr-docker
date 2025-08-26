FROM caddy:builder-alpine AS builder


# caddy-l4
RUN xcaddy build \
    # --with github.com/kadeessh/kadeessh \
    --with github.com/mholt/caddy-l4 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/mholt/caddy-webdav \
    --with github.com/pteich/caddy-tlsconsul

FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy"]
