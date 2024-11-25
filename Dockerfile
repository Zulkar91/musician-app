# Use Node.js 16 LTS as the base image
FROM node:16-alpine AS build

# Set working directory
WORKDIR /usr/src/app

# Copy dependency files and install all dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the application code
COPY . .

# Run tests (fail build if tests fail)
RUN npm test

# Production image
FROM node:16-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy application files from build stage
COPY --from=build /usr/src/app ./

# Install PM2 globally for process management
RUN npm install -g pm2

# Expose application port
EXPOSE 3001

# Start the application
CMD ["pm2", "start", "app.js", "--no-daemon"]
