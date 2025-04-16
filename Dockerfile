# Stage 1: Node.js + Puppeteer Scraper
FROM node:18-slim AS scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
RUN apt-get update && apt-get install -y chromium
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    ca-certificates \
    curl \
    gnupg \
    libxss1 \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    xdg-utils \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /app
COPY scraper.js package.json ./
RUN npm install

ENV SCRAPE_URL=https://example.com
RUN node scraper.js

# Stage 2: Python Flask Server
FROM python:3.10-slim as server

WORKDIR /app
COPY --from=scraper /app/scraped_data.json ./
COPY server.py requirements.txt ./
RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "server.py"]
