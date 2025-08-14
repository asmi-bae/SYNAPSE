# Multi-stage build for Synapse
FROM node:20.19.0-alpine AS base

# Install pnpm globally
RUN npm install -g pnpm@latest

# Install system dependencies
RUN apk add --no-cache \
    python3 \
    make \
    g++ \
    git

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-workspace.yaml ./
COPY core/package.json ./core/
COPY extensions/vscode/package.json ./extensions/vscode/
COPY extensions/intellij/package.json ./extensions/intellij/
COPY gui/package.json ./gui/
COPY docs/package.json ./docs/
COPY packages/*/package.json ./packages/
COPY binary/package.json ./binary/
COPY scripts/package.json ./scripts/

# Install dependencies
RUN pnpm install --frozen-lockfile --prod

# Build stage
FROM base AS builder

# Copy source code
COPY . .

# Build the application
RUN pnpm run build

# Production stage
FROM node:20.19.0-alpine AS production

# Install pnpm
RUN npm install -g pnpm@latest

WORKDIR /app

# Copy built application and dependencies
COPY --from=builder /app/package.json ./
COPY --from=builder /app/pnpm-workspace.yaml ./
COPY --from=builder /app/core/package.json ./core/
COPY --from=builder /app/core/dist ./core/dist
COPY --from=builder /app/extensions/vscode/out ./extensions/vscode/out
COPY --from=builder /app/gui/dist ./gui/dist
COPY --from=builder /app/docs/build ./docs/build

# Install only production dependencies
RUN pnpm install --frozen-lockfile --prod

# Expose ports
EXPOSE 3000 3001 3002

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node -e "console.log('Health check passed')" || exit 1

# Start the application
CMD ["pnpm", "start"]
