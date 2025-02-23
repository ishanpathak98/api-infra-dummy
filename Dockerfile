# Official Node.js runtime as parent image
FROM node:18-alpine

# Working directory
WORKDIR /usr/src/app

# Copy package.json and installing dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy app source code
COPY . .

# Expose app port
EXPOSE 3000

# Run the application
CMD ["node", "src/app.js"]
