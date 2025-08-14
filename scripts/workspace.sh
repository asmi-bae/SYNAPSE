#!/bin/bash

# Synapse pnpm workspace management script
echo "🔧 Synapse pnpm Workspace Manager"

# Function to show usage
show_usage() {
    echo ""
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  install     - Install all dependencies"
    echo "  dev         - Start development mode for all packages"
    echo "  build       - Build all packages"
    echo "  test        - Run tests for all packages"
    echo "  lint        - Run linting for all packages"
    echo "  clean       - Clean all build artifacts"
    echo "  update      - Update all dependencies"
    echo "  outdated    - Check for outdated dependencies"
    echo "  audit       - Run security audit"
    echo "  status      - Show workspace status"
    echo "  help        - Show this help message"
    echo ""
}

# Function to install dependencies
install_deps() {
    echo "📦 Installing dependencies..."
    pnpm install
}

# Function to start development
start_dev() {
    echo "🚀 Starting development mode..."
    pnpm run dev
}

# Function to build all packages
build_all() {
    echo "🔨 Building all packages..."
    pnpm run build
}

# Function to run tests
run_tests() {
    echo "🧪 Running tests..."
    pnpm run test
}

# Function to run linting
run_lint() {
    echo "🔍 Running linting..."
    pnpm run lint
}

# Function to clean build artifacts
clean_all() {
    echo "🧹 Cleaning build artifacts..."
    pnpm run clean
}

# Function to update dependencies
update_deps() {
    echo "⬆️  Updating dependencies..."
    pnpm update
}

# Function to check outdated packages
check_outdated() {
    echo "📋 Checking for outdated packages..."
    pnpm outdated
}

# Function to run security audit
run_audit() {
    echo "🔒 Running security audit..."
    pnpm audit
}

# Function to show workspace status
show_status() {
    echo "📊 Workspace Status:"
    echo ""
    echo "📁 Packages:"
    pnpm list --depth=0
    echo ""
    echo "🔗 Workspace Info:"
    pnpm list --recursive --depth=0
}

# Main script logic
case "${1:-help}" in
    install)
        install_deps
        ;;
    dev)
        start_dev
        ;;
    build)
        build_all
        ;;
    test)
        run_tests
        ;;
    lint)
        run_lint
        ;;
    clean)
        clean_all
        ;;
    update)
        update_deps
        ;;
    outdated)
        check_outdated
        ;;
    audit)
        run_audit
        ;;
    status)
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
