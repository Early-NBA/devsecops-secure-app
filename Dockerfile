FROM python:3.11-slim

WORKDIR /app

COPY web/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY web ./web
COPY vault ./vault

RUN useradd -m appuser
USER appuser

CMD ["python", "web/app.py"]