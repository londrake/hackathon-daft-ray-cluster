FROM python:3.12.8-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    cron \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U 'ray[default]==2.40.0' 'getdaft[aws,deltalake]==0.4.0'

COPY ./docker/ray-cluster/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]