# Stage 1: build (using Node to run Vite build)
FROM node:18-alpine AS builder
WORKDIR /app
COPY package.json ./
COPY package-lock.json* ./
COPY . ./
RUN npm ci --silent || true
RUN npm run build

FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
