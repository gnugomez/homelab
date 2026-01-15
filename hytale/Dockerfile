
# Use a Java 25 base image
FROM eclipse-temurin:25-jre-jammy

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y curl unzip

# Download and unzip the Hytale downloader
RUN curl -o hytale-downloader.zip https://downloader.hytale.com/hytale-downloader.zip && \
    unzip hytale-downloader.zip && \
    rm hytale-downloader.zip

# Run the downloader to get server files
RUN ./hytale-downloader

# Create a non-root user to run the server
RUN useradd -m -s /bin/bash hytale
USER hytale
WORKDIR /home/hytale/server

# Copy server and assets from the downloader output to the server directory
COPY --chown=hytale:hytale /app/output/server/HytaleServer.jar .
COPY --chown=hytale:hytale /app/output/assets/Assets.zip .

# Expose the server port
EXPOSE 5520/udp

# Define volumes for data persistence
VOLUME ["/home/hytale/server/.cache", "/home/hytale/server/logs", "/home/hytale/server/mods", "/home/hytale/server/universe"]

# Set the entrypoint to run the Hytale server
ENTRYPOINT ["java", "-jar", "HytaleServer.jar", "--assets", "Assets.zip"]
