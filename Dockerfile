FROM n8nio/n8n:latest

USER root

RUN microdnf install -y \
    python3 \
    python3-pip \
    python3-virtualenv \
    libreoffice \
    chromium \
    chromedriver \
    fontconfig \
    dejavu-sans-fonts && \
    microdnf clean all

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/pip install --no-cache-dir \
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
