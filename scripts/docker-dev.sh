#!/bin/bash

# Docker development environment script
echo "🐳 Starting Synapse development environment with Docker..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if docker-compose is available
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose is not available. Please install docker-compose and try again."
    exit 1
fi

# Build and start the development environment
echo "🔨 Building and starting development containers..."
docker-compose -f docker/docker-compose.dev.yml up --build -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 10

# Show running containers
echo "📋 Running containers:"
docker-compose -f docker/docker-compose.dev.yml ps

echo ""
echo "✅ Development environment is ready!"
echo ""
echo "Services available at:"
echo "  🌐 GUI: http://localhost:3000"
echo "  🔧 Core: http://localhost:3001"
echo "  📚 Docs: http://localhost:3002"
echo ""
echo "Useful commands:"
echo "  📝 View logs: docker-compose -f docker/docker-compose.dev.yml logs -f"
echo "  🛑 Stop: docker-compose -f docker/docker-compose.dev.yml down"
echo "  🔄 Restart: docker-compose -f docker/docker-compose.dev.yml restart"
echo "  🐛 Enter container: docker exec -it synapse-development bash"
echo ""
echo "Happy coding! 🎉"
