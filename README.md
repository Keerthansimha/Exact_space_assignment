# Puppeteer + Flask Scraper Container

## 📦 Build Docker Image :

```bash
docker build -t scraper-server .

## 🚀 How To Run A Container :

  To run the Docker container and map the container's port to your host machine, use:
```bash
  docker run -d -p 5000:5000 scraper-server

 ## 🌐 How to pass the URL To be Scraped :

 can pass the URL to be scraped as an environment variable when running the container:
```bash
  docker run -d -e SCRAPE_URL=https://example.com scraper-server -p 5000:5000

📄 To Access the Hosted Website  :

  Once the container is running, you can access the website by navigating to:
  ```bash
  http://<EC2-IP>:5000

📄 To Access the  Hosted Scraped Data :

 You can access the scraped data  by navigating to:
  ```bash
  http://<EC2-IP>:5000/data


