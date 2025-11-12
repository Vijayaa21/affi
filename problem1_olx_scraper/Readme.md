# 🌐 Universal Web Scraper (Python)

**Author:** Vijaya Mishra  
**Purpose:** Demonstrate a **safe, simple, and effective web scraping** approach using Python to extract structured information such as product titles and prices from any HTML-based website.  

It scrapes data from *publicly scrape-friendly* sites like [Books to Scrape](https://books.toscrape.com), a sandbox designed for practicing scraping.

---

## 🧠 Why This Method Is Used

This scraper is designed to be:
- ✅ **Lightweight and fast** — no heavy browsers or automation tools.  
- ✅ **Ethically safe** — works only on sites that *allow* scraping.  
- ✅ **Easily adaptable** — works for any page by changing a few selectors.  
- ✅ **Readable & beginner-friendly** — uses Python’s most widely understood libraries.  

Instead of using complex tools like Selenium or Scrapy, this code relies on:
1. **`requests`** → to make HTTP GET requests to fetch the raw HTML.  
2. **`BeautifulSoup`** → to parse and extract specific data (titles, prices, etc.) from that HTML.  
3. **`PrettyTable`** → to print results neatly in tabular format in the terminal.  
4. **`colorama`** → to colorize output (errors, highlights, results) for better visibility in console logs.  

---

## 🧩 Dependencies — What You Need to Install

Before running the script, make sure you have Python 3.8+ installed.

Install the required dependencies using this command:

```bash
pip install requests beautifulsoup4 prettytable colorama

```
▶️ Run the Python Script

After installing all dependencies, you can run the scraper easily using the following command:
```bash
 # Create virtual environment
 python -m venv venv
 # Activate virtual environment (Windows)
 venv\\Scripts\\activate
 # Install dependencies
 pip install selenium beautifulsoup4 pandas webdriver-manager requests lxml
 # Generate requirements.txt
 pip freeze &gt; requirements.txt
 # Run the Python Script
 python olx_scrape.py
