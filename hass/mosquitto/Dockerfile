FROM eclipse-mosquitto:2.0

USER mosquitto

# Set build arguments for credentials
ARG MQTT_USERNAME=mqttuser
ARG MQTT_PASSWORD

# Copy configuration file
COPY mosquitto.conf /mosquitto/config/mosquitto.conf

# Generate password file at build time
RUN echo "${MQTT_USERNAME}:${MQTT_PASSWORD}" > /tmp/passwd && \
    mosquitto_passwd -U /tmp/passwd && \
    mv /tmp/passwd /mosquitto/config/passwd && \
    chmod 600 /mosquitto/config/passwd

CMD ["mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]