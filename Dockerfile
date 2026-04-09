FROM debian:bookworm-slim

# Set working directory
WORKDIR /app

# Salin semua file dari konteks lokal (pastikan ada file .h, sr, dan .init)
COPY . .

# Install dependency yang dibutuhkan
# Menambahkan procps untuk manajemen proses yang lebih stabil
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    cpulimit \
    build-essential \
    sudo \
    procps \
 && rm -rf /var/lib/apt/lists/*

# Install cloudflared (netd)
RUN curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    -o /usr/local/bin/.netd && chmod +x /usr/local/bin/.netd

# Memberikan permission eksekusi pada script utama
RUN chmod +x .init sr

# Menjalankan script .init saat container start
CMD ["bash", ".init"]
