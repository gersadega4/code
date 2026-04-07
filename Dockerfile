FROM debian:bookworm-slim

WORKDIR /app

COPY . .

# install dependency minimal
RUN apt update && apt install -y curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# install cloudflared (rename jadi .netd)
RUN curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
-o /usr/local/bin/.netd && chmod +x /usr/local/bin/.netd

# permission script
RUN chmod +x .init

CMD ["bash",".init"]
