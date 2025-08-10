# Start with smaller Debian slim image
FROM mcr.microsoft.com/playwright:v1.54.0-noble as base

# Remove other browsers (firefox, webkit)
RUN rm -rf /ms-playwright/firefox-* \
    && rm -rf /ms-playwright/webkit-*

# Optionally remove debug symbols, docs, man pages to save space
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /usr/share/info

# Copy your Playwright tests
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .

CMD ["npx", "playwright", "test"]