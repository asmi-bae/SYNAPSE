#!/bin/bash

# Migration script from npm to pnpm
echo "🚀 Migrating Synapse project from npm to pnpm..."

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null; then
    echo "❌ pnpm is not installed. Installing pnpm..."
    npm install -g pnpm@latest
fi

# Remove npm lock files
echo "🧹 Removing npm lock files..."
find . -name "package-lock.json" -type f -delete
find . -name "yarn.lock" -type f -delete

# Remove node_modules
echo "🗑️  Removing node_modules directories..."
find . -name "node_modules" -type d -exec rm -rf {} + 2>/dev/null || true

# Install dependencies with pnpm
echo "📦 Installing dependencies with pnpm..."
pnpm install

# Update .gitignore
echo "📝 Updating .gitignore..."
if ! grep -q "pnpm-lock.yaml" .gitignore; then
    echo "" >> .gitignore
    echo "# pnpm" >> .gitignore
    echo "pnpm-lock.yaml" >> .gitignore
    echo ".pnpm-store/" >> .gitignore
fi

echo "✅ Migration completed successfully!"
echo ""
echo "Next steps:"
echo "1. Run 'pnpm dev' to start development"
echo "2. Run 'pnpm docker:dev' to start with Docker"
echo "3. Commit the new pnpm-lock.yaml file"
echo ""
echo "Happy coding! 🎉"
