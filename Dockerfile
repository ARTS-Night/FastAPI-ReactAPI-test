FROM node:20-alpine AS build
WORKDIR /app

# Copy package manifests first to leverage Docker cache
COPY package.json pnpm-lock.yaml* ./
# Enable corepack and install. If pnpm-lock.yaml exists, use frozen-lockfile for reproducible installs.
RUN corepack enable && \
		if [ -f pnpm-lock.yaml ]; then \
			pnpm install --frozen-lockfile --silent; \
		else \
			pnpm install --silent; \
		fi

# Copy rest of source and build
COPY . .
RUN pnpm run build

FROM nginx:stable-alpine AS production
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]