# Use the official Node.js LTS image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install all dependencies, including development dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port your app listens on (e.g., 3000)
EXPOSE 3001

# Start the application using npm
CMD ["npm", "start"]
