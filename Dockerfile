# Use official Node.js runtime as a parent image
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy application source code
COPY . .

# Expose application port
EXPOSE 3000

# Command to run the application
CMD ["node", "src/app.js"]
