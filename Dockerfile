FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
    libreoffice \
    libreoffice-calc \
    ttf-freefont \
    fontconfig \
    chromium \
    chromium-chromedriver

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --no-cache-dir \
    xlrd \
    openpyxl \
    pandas \
    selenium \
    webdriver-manager

ENV PATH="/opt/venv/bin:$PATH"
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

WORKDIR /home/node

USER node

CMD ["n8n"]
