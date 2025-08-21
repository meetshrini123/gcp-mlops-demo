#  NVIDIA CUDA base image for PyTorch compatibility
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

WORKDIR /app

RUN apt-get update && apt-get install -y python3-pip
COPY requirements.txt .
RUN pip install -r requirements.txt

#  training script
COPY main.py .

ENTRYPOINT ["python3", "main.py"]
