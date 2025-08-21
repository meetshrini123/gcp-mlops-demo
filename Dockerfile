# Use a private NVIDIA CUDA base image from your Artifact Registry
# IMPORTANT: Replace YOUR_PROJECT_ID with your actual GCP Project ID below
FROM europe-west6-docker.pkg.dev/projvdi-01/ml-models/cuda:12.1.0-base-ubuntu22.04

WORKDIR /app

# Install Python and pip
RUN apt-get update && apt-get install -y python3-pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the training script
COPY main.py .

ENTRYPOINT ["python3", "main.py"]
