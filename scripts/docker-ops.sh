#!/bin/bash

# Synapse Docker Operations Script
echo "🐳 Synapse Docker Operations Manager"

# Function to show usage
show_usage() {
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  dev         - Start development environment"
    echo "  build       - Build production image"
    echo "  run         - Run production container"
    echo "  stop        - Stop development environment"
    echo "  logs        - View development logs"
    echo "  shell       - Enter development container"
    echo "  clean       - Clean Docker resources"
    echo "  status      - Show Docker status"
    echo "  help        - Show this help message"
    echo ""
}

# Function to start development environment
start_dev() {
    echo "🚀 Starting development environment..."
    docker-compose -f docker/docker-compose.dev.yml up --build -d
    echo "⏳ Waiting for services to be ready..."
    sleep 10
    echo "✅ Development environment is ready!"
    echo "🌐 GUI: http://localhost:3000"
    echo "🔧 Core: http://localhost:3001"
    echo "📚 Docs: http://localhost:3002"
}

# Function to build production image
build_prod() {
    echo "🔨 Building production image..."
    docker build -t synapse -f docker/Dockerfile .
    echo "✅ Production image built successfully!"
}

# Function to run production container
run_prod() {
    echo "🏃 Running production container..."
    docker run -d --name synapse-prod -p 3000:3000 -p 3001:3001 -p 3002:3002 synapse
    echo "✅ Production container started!"
    echo "🌐 GUI: http://localhost:3000"
    echo "🔧 Core: http://localhost:3001"
    echo "📚 Docs: http://localhost:3002"
}

# Function to stop development environment
stop_dev() {
    echo "🛑 Stopping development environment..."
    docker-compose -f docker/docker-compose.dev.yml down
    echo "✅ Development environment stopped!"
}

# Function to view logs
view_logs() {
    echo "📝 Viewing development logs..."
    docker-compose -f docker/docker-compose.dev.yml logs -f
}

# Function to enter container shell
enter_shell() {
    echo "🐚 Entering development container..."
    docker exec -it synapse-development bash
}

# Function to clean Docker resources
clean_docker() {
    echo "🧹 Cleaning Docker resources..."
    echo "Stopping containers..."
    docker-compose -f docker/docker-compose.dev.yml down
    echo "Removing stopped containers..."
    docker container prune -f
    echo "Removing unused images..."
    docker image prune -f
    echo "Removing unused volumes..."
    docker volume prune -f
    echo "Removing unused networks..."
    docker network prune -f
    echo "✅ Docker cleanup completed!"
}

# Function to show Docker status
show_status() {
    echo "📊 Docker Status:"
    echo ""
    echo "🐳 Running Containers:"
    docker ps
    echo ""
    echo "📦 Images:"
    docker images | grep synapse
    echo ""
    echo "🌐 Port Usage:"
    echo "Port 3000 (GUI): $(lsof -i :3000 2>/dev/null | wc -l) processes"
    echo "Port 3001 (Core): $(lsof -i :3001 2>/dev/null | wc -l) processes"
    echo "Port 3002 (Docs): $(lsof -i :3002 2>/dev/null | wc -l) processes"
}

# Check if Docker is running
check_docker() {
    if ! docker info > /dev/null 2>&1; then
        echo "❌ Docker is not running. Please start Docker and try again."
        exit 1
    fi
}

# Main script logic
case "${1:-help}" in
    dev)
        check_docker
        start_dev
        ;;
    build)
        check_docker
        build_prod
        ;;
    run)
        check_docker
        run_prod
        ;;
    stop)
        check_docker
        stop_dev
        ;;
    logs)
        check_docker
        view_logs
        ;;
    shell)
        check_docker
        enter_shell
        ;;
    clean)
        check_docker
        clean_docker
        ;;
    status)
        check_docker
        show_status
        ;;
    help|--help|-h)
        show_usage
        ;;
    *)
        echo "❌ Unknown command: $1"
        show_usage
        exit 1
        ;;
esac

echo ""
echo "✅ Command completed successfully!"
