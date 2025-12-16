# Chainlink Masterclass Docker Setup

Complete Docker environment with all prerequisites for the Chainlink masterclass.

## 🚀 Quick Start (5 minutes)

```bash
# 1. Build the Docker image (takes 2-3 minutes)
make build

# 2. Start the container
make run

# 3. Enter the container shell
make shell

# 4. Verify everything is installed
make verify
```

## 📋 What's Included

✅ Node.js v18  
✅ Bun v1.3+  
✅ Chainlink Runtime Environment (CRE)  
✅ mdBook for documentation  
✅ Git, curl, and essential build tools  

## 🔧 Setup Steps

### Before the Masterclass

1. **Build and start the environment:**
   ```bash
   make build
   make run
   make shell
   ```

2. **Create your .env file with API keys:**
   ```bash
   make env-setup
   # Then edit workspace/.env with your keys
   ```

3. **Get your credentials ready:**
   - ✓ Base Sepolia added to your wallet
   - ✓ Base Sepolia ETH from [Coinbase faucet](https://www.coinbase.com/faucets/base-ethereum-sepolia-faucet)
   - ✓ USDC from [Circle faucet](https://faucet.circle.com/) (Base Sepolia)
   - ✓ Gemini LLM API key
   - ✓ Pushover User Key and App Key

### During the Masterclass

Your workspace folder is mounted at `/workspace` inside the container. Any files you create/edit in the container will be synced to your local `workspace/` folder.

```bash
# Enter container
make shell

# You're now in the container, ready to follow along!
# All your work will be in /workspace
cd /workspace
```

## 📖 Available Commands

| Command | Description |
|---------|-------------|
| `make help` | Show all available commands |
| `make build` | Build Docker image with all tools |
| `make run` | Start the container |
| `make shell` | Open interactive shell in container |
| `make stop` | Stop the container |
| `make restart` | Restart the container |
| `make verify` | Check all tools are installed |
| `make env-setup` | Create .env template |
| `make status` | Show container status |
| `make logs` | View container logs |
| `make clean` | Remove container (keeps image) |
| `make clean-all` | Remove container and image |

## 🎯 Workflow Tips

### Working with Files

The `workspace/` folder is automatically synced:
- Files you create locally appear in the container
- Files you create in the container appear locally
- You can edit with your favorite local editor while running commands in the container

### Quick Access

```bash
# Always have a terminal with the container shell open:
make shell

# In another terminal, monitor logs if needed:
make logs
```

### Managing API Keys

Edit `workspace/.env` with your actual keys:

```bash
# Edit locally with your editor
nano workspace/.env  # or vim, vscode, etc.

# Keys are available in the container
```

## 🔍 Verification

Check everything works:

```bash
make verify
```

Should show:
```
✓ Node.js installed
✓ Bun installed
✓ CRE installed
✓ mdBook installed
```

## 🐛 Troubleshooting

### Container won't start
```bash
make clean
make build
make run
```

### Need to restart from scratch
```bash
make clean-all
make build
make run
make shell
```

### Check container status
```bash
make status
```

### View logs for errors
```bash
make logs
```

## 📁 Directory Structure

```
.
├── Dockerfile          # Container definition
├── Makefile           # Helper commands
├── README.md          # This file
└── workspace/         # Your working directory (synced with container)
    └── .env          # API keys and configuration
```

## 🎓 Ready for the Masterclass!

Once you've run through the Quick Start, you're ready to go:

1. Container is running ✓
2. All tools installed ✓
3. API keys configured ✓
4. Shell is open ✓

Just follow along with the instructor - all commands will work in your container!

## 💡 Pro Tips

- Keep `make shell` running in one terminal for the masterclass
- Use your local editor to edit files in `workspace/`
- The container persists between stops/starts (your work is saved)
- Use `make verify` if something seems off

---

**Need help?** Run `make help` to see all commands.

**Starting masterclass now?** Just run `make shell` and you're ready!