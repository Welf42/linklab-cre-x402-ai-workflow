#!/bin/bash
# Quick setup script for Chainlink Masterclass
# Run this 10 minutes before the class starts!

set -e

echo "🚀 Chainlink Masterclass - Quick Setup"
echo "======================================"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker first."
    exit 1
fi

echo "✓ Docker is running"
echo ""

# Step 1: Build
echo "📦 Step 1/4: Building Docker image (2-3 minutes)..."
make build

# Step 2: Run
echo ""
echo "🏃 Step 2/4: Starting container..."
make run
sleep 2

# Step 3: Setup env
echo ""
echo "📝 Step 3/4: Setting up environment..."
make env-setup

# Step 4: Verify
echo ""
echo "✅ Step 4/4: Verifying installation..."
make verify

echo ""
echo "======================================"
echo "🎉 Setup Complete!"
echo ""
echo "⚠️  IMPORTANT: Edit workspace/.env with your API keys:"
echo "   - Gemini API key"
echo "   - Pushover User Key"
echo "   - Pushover App Key"
echo ""
echo "When ready for the masterclass, run:"
echo "   make shell"
echo ""
echo "Good luck! 🍀"