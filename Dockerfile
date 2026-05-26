FROM node:22-bookworm-slim

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    libreoffice \
    chromium \
    chromium-driver \
    fontconfig \
    fonts-dejavu \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --no-cache-dir \
    xlrd \
    openpyxl \
    pandas \
    selenium \
    webdriver-manager

RUN npm install -g n8n

ENV PATH="/opt/venv/bin:$PATH"
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

ENV N8N_PORT=10000
ENV PORT=10000

WORKDIR /home/node

EXPOSE 10000

CMD ["n8n", "start"]
