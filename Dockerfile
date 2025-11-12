# Base image
FROM node:18-alpine

# Working directory inside container
WORKDIR /app

# Copy all files to container
COPY . .

# Install dependencies & build project
RUN npm install && npm run build

# Expose the port (Vite preview port)
EXPOSE 4173

# Start the preview server
CMD ["npm", "run", "preview"]
