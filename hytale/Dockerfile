
# First stage: Download the server
FROM alpine:latest AS downloader

# Install necessary tools
RUN apk add --no-cache curl unzip

# Set working directory
WORKDIR /download

# Download and extract the downloader
RUN curl -o hytale-downloader.zip https://downloader.hytale.com/hytale-downloader.zip && \
    unzip -q -o hytale-downloader.zip && \
    rm hytale-downloader.zip

# Run the downloader (this will require user authentication via link)
RUN ./hytale-downloader-linux-amd64

# Extract the downloaded server files
RUN unzip -q -o *.zip -d output && \
    cp output/Server/HytaleServer.jar . && \
    cp output/Assets.zip .

# Second stage: Final runtime image
FROM eclipse-temurin:25-jre-alpine

# Create a non-root user to run the server
RUN adduser -D hytale
USER hytale
WORKDIR /home/hytale/server

# Copy downloaded server files from the downloader stage
COPY --from=downloader /download/HytaleServer.jar .
COPY --from=downloader /download/Assets.zip .

# Expose the server port
EXPOSE 5520/udp

# Define volumes for data persistence
VOLUME ["/home/hytale/server/.cache", "/home/hytale/server/logs", "/home/hytale/server/mods", "/home/hytale/server/universe"]

# Set the entrypoint to run the server
ENTRYPOINT ["java", "-jar", "HytaleServer.jar", "--assets", "Assets.zip"]
