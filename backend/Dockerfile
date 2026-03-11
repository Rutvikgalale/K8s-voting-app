# Base Image
FROM node:18-slim

# Install Tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tini && \
    rm -rf /var/lib/apt/lists/*

# Set Working Directory
WORKDIR /app

# Nodemon automatically restarts Node.js when files change 
RUN npm install -g nodemon

COPY package*.json ./

# Install Dependencies
RUN npm ci && \
 npm cache clean --force && \
 mv /app/node_modules /node_modules


COPY . .

ENV PORT=80
EXPOSE 80

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["node", "server.js"]


