
ckerfile
FROM python:3.9-slim

WORKDIR /app

RUN pip install pandas scikit-learn joblib

COPY main.py .

ENTRYPOINT ["python", "main.py"]
