# Use the official Node.js LTS image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json for dependency installation
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Install PM2 globally
RUN npm install -g pm2

# Copy the rest of the application files
COPY . .

# Expose the port your app listens on (e.g., 3001)
EXPOSE 3001

# Start the application using PM2
CMD ["pm2", "start", "app.js", "--no-daemon"]
