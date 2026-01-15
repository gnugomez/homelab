# Hytale Server

This directory contains a `Dockerfile` and `compose.yml` to run a Hytale server.

## Usage

1.  **Build and start the server:**
    ```bash
    docker-compose up -d --build
    ```

2.  **Authentication:**
    On the first run, you need to authenticate the server. Check the logs for the authentication URL and code:
    ```bash
    docker-compose logs -f hytale
    ```
    Open the URL in your browser and enter the code.

3.  **Stopping the server:**
    ```bash
    docker-compose down
    ```

## Configuration

-   The server files are stored in the `hytale` directory.
-   The `.cache`, `logs`, `mods`, and `universe` directories are mapped as volumes to persist data.
-   The server port `5520/udp` is exposed.
