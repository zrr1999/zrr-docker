FROM caddy:builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/tencentcloud \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/mholt/caddy-webdav \
    --with github.com/pteich/caddy-tlsconsul \
    --with github.com/kadeessh/kadeessh

FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
CMD ["caddy", "docker-proxy"]
