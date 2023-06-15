FROM rust:alpine as build
ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
RUN apk add --no-cache --update musl-dev git \
&& git clone https://github.com/typst/typst.git /app
WORKDIR /app
RUN cargo build -p typst-cli --release

FROM zrr1999/zrr-base:latest
COPY --from=build /app/target/release/typst /bin

WORKDIR "/workspace"
EXPOSE 22
