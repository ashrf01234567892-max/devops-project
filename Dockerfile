# Stage 1: Build React app
FROM node:22-slim AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install --production --no-audit --no-fund

COPY . .
RUN npm run build

# Stage 2: Serve with Nginx (lightweight & production-ready)
FROM nginx:stable-alpine

COPY --from=builder /app/build /usr/share/nginx/html

# Custom nginx for React Router (refresh works on all pages)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --no-verbose --tries=1 --spider http://localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]