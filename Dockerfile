# Use a pre-built Playwright Docker image as the base image.
# It includes Node.js and all the browser dependencies.
# This specific version is based on Ubuntu 22.04 LTS.
FROM mcr.microsoft.com/playwright:v1.54.0-noble


# Set the working directory inside the container to /app...
WORKDIR /app

# Copy the package.json and package-lock.json files
# This helps with Docker's layer caching to speed up builds
COPY package*.json ./

# Set NODE_ENV=development so npm ci installs devDependencies too
ENV NODE_ENV=development

# Install Playwright browsers (chromium, firefox, webkit)....its reuired for older images like focal for noble not rquired
#RUN npx playwright install
# Install project dependencies............use npm install or mpm ci any one only
#RUN npm install
# Install project dependencies...# Install Node.js dependencies using npm ci (clean install)
RUN npm ci
# Copy the rest of your application code into the container...# Copy the entire automation script from the host to the container's working directory
COPY . .

# Set the command that runs when the container starts
CMD ["npx", "playwright", "test"]
#CMD ["npx", "playwright", "test", "--reporter=html", "--output=playwright-report"]