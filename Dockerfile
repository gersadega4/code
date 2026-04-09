FROM debian:bookworm-slim

# Set working directory
WORKDIR /app

# Copy semua file (pastikan hanya yang perlu)
COPY . .

# Install dependency yang masih relevan
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    build-essential \
    procps \
 && rm -rf /var/lib/apt/lists/*

# Permission
RUN chmod +x .init sr

# Run
CMD ["bash", ".init"]
