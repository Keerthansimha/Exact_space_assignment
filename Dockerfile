# Stage 1: Node.js + Puppeteer Scraper
FROM node:18-slim as scraper

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

RUN apt-get update && apt-get install -y \
  chromium chromium-fonts \
  --no-install-recommends && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY scrape.js package.json ./
RUN npm install
ENV SCRAPE_URL=https://example.com
RUN node scrape.js

# Stage 2: Python Flask Server
FROM python:3.10-slim as server

WORKDIR /app
COPY --from=scraper /app/scraped_data.json ./
COPY server.py requirements.txt ./
RUN pip install -r requirements.txt

EXPOSE 5000
CMD ["python", "server.py"]
