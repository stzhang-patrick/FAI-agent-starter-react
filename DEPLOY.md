# LiveKit React UI

## Quick Start

```bash
# Build the image (includes .env.local)
docker build -t livekit-react-ui:1.0 .

# Run the container
docker run -d \
    --name livekit-react-ui \
    --network host \
    livekit-react-ui:1.0
```

## Access the React UI

Visit [http://localhost:3010](http://localhost:3010) in your browser to access the React UI.
