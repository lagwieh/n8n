FROM n8nio/n8n:latest

USER root

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    libreoffice \
    chromium \
    chromium-driver

RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir \
    xlrd \
    openpyxl \
    pandas \
    selenium \
    webdriver-manager

ENV PATH="/opt/venv/bin:$PATH"
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

WORKDIR /home/node

USER node

CMD ["n8n"]
