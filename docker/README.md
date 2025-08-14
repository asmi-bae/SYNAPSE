# Docker Configuration

This folder contains all Docker-related configuration files for the Synapse project.

## 📁 File Structure

- **`Dockerfile`** - Production multi-stage build
- **`Dockerfile.dev`** - Development environment with hot reloading
- **`docker-compose.dev.yml`** - Development services configuration
- **`.dockerignore`** - Files to exclude from Docker builds

## 🚀 Quick Start

### Development Environment

```bash
# From project root
pnpm docker:dev

# Or manually
docker-compose -f docker/docker-compose.dev.yml up --build
```

### Production Build

```bash
# From project root
pnpm docker:build

# Or manually
docker build -t synapse -f docker/Dockerfile .
```

## 🔧 Configuration

### Development (`docker-compose.dev.yml`)

- **Ports**: 3000 (GUI), 3001 (Core), 3002 (Docs)
- **Volumes**: Source code mounted for hot reloading
- **Environment**: Development mode with debugging

### Production (`Dockerfile`)

- **Multi-stage**: Base → Builder → Production
- **Optimized**: Minimal production image
- **Health checks**: Built-in health monitoring

## 📝 Usage Examples

### View Logs

```bash
docker-compose -f docker/docker-compose.dev.yml logs -f
```

### Stop Services

```bash
docker-compose -f docker/docker-compose.dev.yml down
```

### Enter Container

```bash
docker exec -it synapse-development bash
```

### Clean Build

```bash
docker build --no-cache -t synapse -f docker/Dockerfile .
```

## 🐛 Troubleshooting

### Port Conflicts

If ports are already in use, check what's using them:

```bash
lsof -i :3000
lsof -i :3001
lsof -i :3002
```

### Permission Issues

Make sure scripts are executable:

```bash
chmod +x scripts/*.sh
```

### Build Failures

Clean Docker cache and rebuild:

```bash
docker system prune -a
docker build --no-cache -t synapse -f docker/Dockerfile .
```

## 📚 More Information

- **Main Documentation**: See `DOCKER_SETUP.md` in project root
- **Scripts**: Check `scripts/docker-dev.sh` for convenience commands
- **Package Scripts**: Use `pnpm docker:*` commands from project root
