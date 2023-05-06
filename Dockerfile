FROM ghcr.io/puppeteer/puppeteer:19.9.0

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

# Add USER instruction
USER root

COPY package*.json ./
RUN yarn
COPY . .

# Change ownership of node_modules directory
RUN chown -R node:node /usr/src/app/node_modules

# Switch back to non-root user
USER node

CMD [ "node", "index.js" ]
