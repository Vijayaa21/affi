import requests
from bs4 import BeautifulSoup
from prettytable import PrettyTable
from colorama import Fore, Style, init

# Initialize colorama
init(autoreset=True)

def truncate(text, length=70):
    """Shorten text for cleaner table display."""
    return text[:length] + "..." if len(text) > length else text


def scrape_page(url, title_tag="h3", desc_tag="p", price_tag="p.price_color", limit=15):
    """
    Universal web scraper for any HTML page.
    Default setup works perfectly with 'Books to Scrape'.
    """
    print(Fore.CYAN + f"\n🔍 Scraping page: {url}\n" + Style.RESET_ALL)

    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }

    try:
        response = requests.get(url, headers=headers, timeout=15)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, "html.parser")

        # Find elements
        titles = [tag.get_text(strip=True) for tag in soup.select("h3 a")]
        prices = [tag.get_text(strip=True) for tag in soup.select(price_tag)]

        # Prepare table
        table = PrettyTable()
        table.field_names = ["Title", "Price"]
        table.align["Title"] = "l"
        table.align["Price"] = "r"

        # Add rows
        for i in range(min(limit, len(titles))):
            table.add_row([truncate(titles[i]), prices[i] if i < len(prices) else "N/A"])

        print(Fore.GREEN + "📚 Results:\n" + Style.RESET_ALL)
        print(table)
        print(Fore.CYAN + f"\n✅ Scraped and displayed {min(limit, len(titles))} books.\n" + Style.RESET_ALL)

    except requests.exceptions.RequestException as e:
        print(Fore.RED + f"❌ Network error: {e}")


if __name__ == "__main__":
    # ✅ Safe, scrape-friendly site
    scrape_page("https://books.toscrape.com/")

    