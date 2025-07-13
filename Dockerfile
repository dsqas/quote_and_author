FROM python:3.12

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libvulkan1 \
    xdg-utils \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    libgbm1 \
    libgtk-3-0 \
    libxshmfence1 \
    libxcb1 \
    x11-xserver-utils \
    --no-install-recommends

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
 && apt-get install -y ./google-chrome-stable_current_amd64.deb \
 && rm google-chrome-stable_current_amd64.deb

# Указываем точную версию ChromeDriver (совпадает с Chrome 114+)
ENV CHROMEDRIVER_VERSION=114.0.5735.90

RUN wget -q https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip \
 && unzip chromedriver_linux64.zip \
 && mv chromedriver /usr/local/bin/chromedriver \
 && chmod +x /usr/local/bin/chromedriver \
 && rm chromedriver_linux64.zip

RUN pip install --upgrade pip selenium

COPY app.py .

CMD ["python", "app.py"]
