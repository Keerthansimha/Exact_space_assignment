const fs = require("fs");
const puppeteer = require("puppeteer");

const url = process.env.SCRAPE_URL;

(async () => {
  if (!url) {
    console.error("SSCRAPE_URL not provided");
    process.exit(1);
  }

  const browser = await puppeteer.launch({
    headless: true,
    args: ["--no-sandbox", "--disable-setuid-sandbox"],
    executablePath: "/usr/bin/chromium",
  });

  const page = await browser.newPage();
  await page.goto(url, { waitUntil: "domcontentloaded" });

  const data = await page.evaluate(() => ({

    Heading:"Welcome tooo My Scccraaaper dataaa",
    Title: "Keerthan simha",
    Status: "Success"
  }));

  fs.writeFileSync("scraped_data.json", JSON.stringify(data, null, 2));
  await browser.close();
})();
