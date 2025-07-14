from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
import time

options = Options()
options.add_argument("--headless")
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")

service = Service("/usr/local/bin/chromedriver")
driver = webdriver.Chrome(service=service, options=options)

driver.get("http://quotes.toscrape.com/")
time.sleep(2)

quote = driver.find_element(By.CSS_SELECTOR, "div.quote span.text")
author = driver.find_element(By.CSS_SELECTOR, "div.quote small.author")

print("Цитата:", quote.text)
print("Автор:", author.text)

time.sleep(3) 

driver.quit()
