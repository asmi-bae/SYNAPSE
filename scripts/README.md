# Synapse Scripts

This folder contains various utility scripts for managing the Synapse project.

## 🚀 Quick Start Scripts

### **`migrate-to-pnpm.sh`** - Convert from npm to pnpm

```bash
# Make executable and run
chmod +x scripts/migrate-to-pnpm.sh
./scripts/migrate-to-pnpm.sh
```

**What it does:**

- Installs pnpm globally
- Removes npm lock files and node_modules
- Installs dependencies with pnpm
- Updates .gitignore for pnpm

### **`docker-dev.sh`** - Start Docker development environment

```bash
# Make executable and run
chmod +x scripts/docker-dev.sh
./scripts/docker-dev.sh
```

**What it does:**

- Checks Docker availability
- Builds and starts development containers
- Shows service URLs and useful commands

## 🔧 Workspace Management

### **`workspace.sh`** - pnpm workspace operations

```bash
# Make executable
chmod +x scripts/workspace.sh

# Install dependencies
./scripts/workspace.sh install

# Start development
./scripts/workspace.sh dev

# Build all packages
./scripts/workspace.sh build

# Run tests
./scripts/workspace.sh test

# Check status
./scripts/workspace.sh status
```

**Available commands:**

- `install` - Install all dependencies
- `dev` - Start development mode
- `build` - Build all packages
- `test` - Run tests
- `lint` - Run linting
- `clean` - Clean build artifacts
- `update` - Update dependencies
- `outdated` - Check outdated packages
- `audit` - Security audit
- `status` - Show workspace status

## 🐳 Docker Operations

### **`docker-ops.sh`** - Docker management

```bash
# Make executable
chmod +x scripts/docker-ops.sh

# Start development environment
./scripts/docker-ops.sh dev

# Build production image
./scripts/docker-ops.sh build

# View logs
./scripts/docker-ops.sh logs

# Enter container shell
./scripts/docker-ops.sh shell
```

**Available commands:**

- `dev` - Start development environment
- `build` - Build production image
- `run` - Run production container
- `stop` - Stop development environment
- `logs` - View development logs
- `shell` - Enter development container
- `clean` - Clean Docker resources
- `status` - Show Docker status

## 🏗️ Build Scripts

### **`build-packages.js`** - Build Synapse packages

```bash
# From project root
node scripts/build-packages.js
```

**What it does:**

- Builds all Synapse packages
- Handles dependencies between packages
- Generates distribution files

### **`install-dependencies.sh`** - Install dependencies (Linux/macOS)

```bash
# Make executable and run
chmod +x scripts/install-dependencies.sh
./scripts/install-dependencies.sh
```

### **`install-dependencies.ps1`** - Install dependencies (Windows)

```powershell
# Run in PowerShell
.\scripts\install-dependencies.ps1
```

## 🧹 Maintenance Scripts

### **`uninstall.js`** - Uninstall Synapse

```bash
# From project root
node scripts/uninstall.js
```

**What it does:**

- Removes Synapse installation
- Cleans up configuration files
- Removes binary files

### **`create-docker-ssh-container.sh`** - Create SSH container

```bash
# Make executable and run
chmod +x scripts/create-docker-ssh-container.sh
./scripts/create-docker-ssh-container.sh
```

**What it does:**

- Creates a Docker container with SSH access
- Useful for remote development
- Sets up development environment

## 🔍 Utility Scripts

### **`oneper`** - One-per-line processor

```bash
# Make executable
chmod +x scripts/oneper

# Process input line by line
echo "input" | ./scripts/oneper
```

**What it does:**

- Processes input one line at a time
- Useful for batch operations
- Handles large datasets efficiently

## 📋 Usage Examples

### **Complete Development Setup**

```bash
# 1. Migrate to pnpm
./scripts/migrate-to-pnpm.sh

# 2. Start Docker development
./scripts/docker-dev.sh

# 3. Or start local development
./scripts/workspace.sh dev
```

### **Daily Development Workflow**

```bash
# Start development
./scripts/workspace.sh dev

# Check status
./scripts/workspace.sh status

# View Docker logs
./scripts/docker-ops.sh logs

# Stop when done
./scripts/docker-ops.sh stop
```

### **Package Management**

```bash
# Update dependencies
./scripts/workspace.sh update

# Check for outdated packages
./scripts/workspace.sh outdated

# Run security audit
./scripts/workspace.sh audit
```

## 🐛 Troubleshooting

### **Permission Denied**

```bash
# Make all scripts executable
chmod +x scripts/*.sh
```

### **Script Not Found**

```bash
# Check if script exists
ls -la scripts/

# Make sure you're in the project root
pwd
```

### **Docker Issues**

```bash
# Check Docker status
./scripts/docker-ops.sh status

# Clean Docker resources
./scripts/docker-ops.sh clean
```

## 📚 Related Documentation

- **Main Setup**: See `DOCKER_SETUP.md` in project root
- **Docker Config**: See `docker/README.md`
- **Package Scripts**: Use `pnpm run` commands from project root

## 🤝 Contributing

When adding new scripts:

1. **Make them executable**: `chmod +x scripts/script-name.sh`
2. **Add documentation**: Update this README
3. **Follow naming**: Use descriptive names with `.sh` extension
4. **Add help**: Include `--help` or `-h` option
5. **Test thoroughly**: Ensure scripts work in different environments

## 🎯 Script Categories

- **🚀 Quick Start**: `migrate-to-pnpm.sh`, `docker-dev.sh`
- **🔧 Workspace**: `workspace.sh`
- **🐳 Docker**: `docker-ops.sh`
- **🏗️ Build**: `build-packages.js`
- **📦 Dependencies**: `install-dependencies.*`
- **🧹 Maintenance**: `uninstall.js`, `create-docker-ssh-container.sh`
- **🔍 Utilities**: `oneper`

Happy scripting! 🎉
