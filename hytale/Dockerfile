
# Use a Java 25 base image
FROM eclipse-temurin:25-jre-jammy

# Set working directory
WORKDIR /app

# Install necessary tools
RUN apt-get update && apt-get install -y curl unzip

# Create a non-root user to run the server
RUN useradd -m -s /bin/bash hytale
USER hytale
WORKDIR /home/hytale/server

# Copy start script
COPY --chown=hytale:hytale start.sh .
RUN chmod +x start.sh

# Expose the server port
EXPOSE 5520/udp

# Define volumes for data persistence
VOLUME ["/home/hytale/server/.cache", "/home/hytale/server/logs", "/home/hytale/server/mods", "/home/hytale/server/universe"]

# Set the entrypoint to run the start script
ENTRYPOINT ["./start.sh"]
