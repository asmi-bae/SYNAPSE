# Docker + pnpm Setup for Synapse

This document explains how to use Docker and pnpm for development and production deployment of the Synapse project.

## 🚀 Quick Start

### Prerequisites

- **Docker** (20.10+)
- **Docker Compose** (2.0+)
- **Node.js** 20.19.0+ (for local development)

### 1. Start Development Environment

```bash
# Using the convenience script
chmod +x scripts/docker-dev.sh
./scripts/docker-dev.sh

# Or manually
docker-compose -f docker/docker-compose.dev.yml up --build
```

### 2. Access Services

- **GUI**: http://localhost:3000
- **Core API**: http://localhost:3001
- **Documentation**: http://localhost:3002

## 🐳 Docker Commands

### Development

```bash
# Start development environment
pnpm docker:dev

# View logs
docker-compose -f docker/docker-compose.dev.yml logs -f

# Stop services
docker-compose -f docker/docker-compose.dev.yml down

# Restart services
docker-compose -f docker/docker-compose.dev.yml restart

# Enter container
docker exec -it synapse-development bash
```

### Production

```bash
# Build production image
pnpm docker:build

# Run production container
pnpm docker:run

# Or manually
docker build -t synapse .
docker run -p 3000:3000 -p 3001:3001 -p 3002:3002 synapse
```

## 📦 pnpm Commands

### Local Development (without Docker)

```bash
# Install dependencies
pnpm install

# Start all services
pnpm dev

# Start specific service
pnpm dev:gui      # GUI only
pnpm dev:core     # Core only
pnpm dev:vscode   # VSCode extension
pnpm dev:docs     # Documentation

# Build all packages
pnpm build

# Test all packages
pnpm test

# Lint all packages
pnpm lint
```

### Package Management

```bash
# Add dependency to root
pnpm add <package>

# Add dependency to specific package
pnpm --filter <package-name> add <dependency>

# Add dev dependency
pnpm add -D <package>

# Remove dependency
pnpm remove <package>

# Update dependencies
pnpm update
```

## 🔧 Migration from npm

If you're migrating from npm to pnpm:

```bash
# Run migration script
chmod +x scripts/migrate-to-pnpm.sh
./scripts/migrate-to-pnpm.sh
```

The script will:

1. Install pnpm globally
2. Remove npm lock files
3. Clean node_modules
4. Install dependencies with pnpm
5. Update .gitignore

## 🏗️ Project Structure

```
synapse/
├── core/                 # Core library
├── extensions/           # IDE extensions
│   ├── vscode/          # VS Code extension
│   └── intellij/        # IntelliJ plugin
├── gui/                  # Web GUI
├── docs/                 # Documentation
├── packages/             # Shared packages
├── binary/               # Binary builds
├── scripts/              # Build scripts
├── docker/               # Docker configuration
│   ├── Dockerfile        # Production Dockerfile
│   ├── Dockerfile.dev    # Development Dockerfile
│   ├── docker-compose.dev.yml # Development compose
│   └── .dockerignore     # Docker ignore rules
├── pnpm-workspace.yaml   # pnpm workspace config
```

## 🌟 Benefits of Docker + pnpm

### Docker Benefits

- **Consistent Environment**: Same setup across all machines
- **Isolation**: No conflicts with local Node.js versions
- **Easy Deployment**: Production-ready containers
- **Team Collaboration**: Everyone has the same setup

### pnpm Benefits

- **Faster**: Parallel installation and efficient disk usage
- **Monorepo Support**: Better workspace management
- **Strict Dependencies**: Prevents phantom dependencies
- **Disk Space**: Shared dependencies across packages

## 🐛 Troubleshooting

### Common Issues

1. **Port Already in Use**

   ```bash
   # Check what's using the port
   lsof -i :3000

   # Kill the process or change ports in docker-compose.dev.yml
   ```

2. **Permission Denied**

   ```bash
   # Make scripts executable
   chmod +x scripts/*.sh
   ```

3. **Docker Build Fails**

   ```bash
   # Clean Docker cache
   docker system prune -a

   # Rebuild without cache
   docker build --no-cache -t synapse .
   ```

4. **pnpm Install Fails**

   ```bash
   # Clear pnpm store
   pnpm store prune

   # Reinstall
   rm -rf node_modules
   pnpm install
   ```

### Getting Help

- Check Docker logs: `docker-compose -f docker-compose.dev.yml logs`
- Enter container: `docker exec -it synapse-development bash`
- View running containers: `docker ps`

## 📚 Additional Resources

- [pnpm Documentation](https://pnpm.io/)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Synapse Documentation](https://docs.synapse.dev/)

## 🤝 Contributing

When contributing to Synapse:

1. Use the Docker development environment
2. Follow the pnpm workspace structure
3. Test your changes in the containerized environment
4. Update this documentation if needed

Happy coding! 🎉
