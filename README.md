# Puppeteer + Flask Scraper Container

## 📦 Build Docker Image :

```bash
docker build -t scraper-server .

## 🚀 How To Run A Container :

```bash

  To run the Docker container and map the container's port to your host machine, use:
  docker run -d -p 5000:5000 scraper-server

 ## 🌐 How to pass the URL To be Scraped :

 can pass the URL to be scraped as an environment variable when running the container:
  docker run -d -e SCRAPE_URL=https://example.com scraper-server -p 5000:5000


