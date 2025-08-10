FROM registry.access.redhat.com/ubi9/nodejs-18

# Install dependencies for Chromium
RUN dnf install -y chromium liberation-fonts ipa-gothic-fonts \
    libXcomposite libXdamage libXrandr libXcursor libXinerama libXi libXScrnSaver \
    alsa-lib atk cups-libs gtk3 pango xorg-x11-server-Xvfb && \
    dnf clean all

# Install Playwright Chromium only
RUN npm install -g playwright && \
    npx playwright install chromium

# Copy your Playwright tests
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .

CMD ["npx", "playwright", "test"]