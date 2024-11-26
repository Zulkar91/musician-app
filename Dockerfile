# Use the official Node.js 14 LTS image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all files to the working directory
COPY . .

# Expose the application port
EXPOSE 3001

# Start the application
CMD ["npm", "start"]
