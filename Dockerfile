# Use the official Node.js LTS image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy only package.json and package-lock.json to leverage Docker caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application (if needed, e.g., for frontend builds)
# RUN npm run build   # Uncomment if your app requires a build step

# Expose the port your app runs on
EXPOSE 3000

# Start the Node.js application
CMD ["npm", "start"]
