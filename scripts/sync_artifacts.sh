#!/bin/bash

# Configuration
# Replace with your actual GCP bucket name
BUCKET_NAME="gs://socfoundry-downloads" 
ARTIFACT_DIR="web/downloads"

# Ensure gcloud/gsutil is installed
if ! command -v gsutil &> /dev/null; then
    echo "Error: gsutil is not installed or not in PATH."
    exit 1
fi

case "$1" in
  push)
    echo "Uploading artifacts from $ARTIFACT_DIR to $BUCKET_NAME..."
    # Check if files exist
    if ls "$ARTIFACT_DIR"/*.deb 1> /dev/null 2>&1; then
        gsutil cp "$ARTIFACT_DIR"/*.deb "$BUCKET_NAME/"
        echo "Upload complete."
    else
        echo "No .deb files found in $ARTIFACT_DIR to upload."
    fi
    ;;
  pull)
    echo "Downloading artifacts from $BUCKET_NAME to $ARTIFACT_DIR..."
    mkdir -p "$ARTIFACT_DIR"
    gsutil cp "$BUCKET_NAME"/*.deb "$ARTIFACT_DIR/"
    echo "Download complete."
    ;;
  *)
    echo "Usage: $0 {push|pull}"
    echo "  push: Uploads local .deb files in web/downloads to GCS"
    echo "  pull: Downloads .deb files from GCS to web/downloads"
    exit 1
esac
