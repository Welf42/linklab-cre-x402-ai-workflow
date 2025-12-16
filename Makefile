.PHONY: build run shell stop clean restart logs help

# Docker image name
IMAGE_NAME = chainlink-masterclass
CONTAINER_NAME = chainlink-dev

help: ## Show this help message
	@echo "Chainlink Masterclass Docker Environment"
	@echo "========================================"
	@echo ""
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Quick Start:"
	@echo "  1. make build    - Build the Docker image"
	@echo "  2. make run      - Start the container"
	@echo "  3. make shell    - Enter the container"

build: ## Build the Docker image with all prerequisites
	@echo "Building Docker image with Node.js, Bun, CRE, and mdBook..."
	docker build -t $(IMAGE_NAME) .
	@echo "✓ Build complete!"

run: ## Start the container (creates if doesn't exist)
	@if [ "$$(docker ps -a -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "Container exists. Starting..."; \
		docker start $(CONTAINER_NAME); \
	else \
		echo "Creating and starting new container..."; \
		docker run -d --name $(CONTAINER_NAME) \
			-v $(PWD)/workspace:/workspace \
			-p 3000:3000 \
			-p 8080:8080 \
			$(IMAGE_NAME) \
			tail -f /dev/null; \
	fi
	@echo "✓ Container is running!"

shell: ## Open a shell inside the container
	@if [ ! "$$(docker ps -q -f name=$(CONTAINER_NAME))" ]; then \
		echo "Container not running. Starting first..."; \
		$(MAKE) run; \
		sleep 2; \
	fi
	docker exec -it $(CONTAINER_NAME) /bin/bash

stop: ## Stop the container
	@echo "Stopping container..."
	docker stop $(CONTAINER_NAME)
	@echo "✓ Container stopped"

restart: ## Restart the container
	@echo "Restarting container..."
	docker restart $(CONTAINER_NAME)
	@echo "✓ Container restarted"

logs: ## Show container logs
	docker logs -f $(CONTAINER_NAME)

clean: ## Remove container (keeps image)
	@echo "Removing container..."
	-docker stop $(CONTAINER_NAME) 2>/dev/null
	-docker rm $(CONTAINER_NAME) 2>/dev/null
	@echo "✓ Container removed"

clean-all: clean ## Remove container and image
	@echo "Removing image..."
	-docker rmi $(IMAGE_NAME) 2>/dev/null
	@echo "✓ Image removed"

verify: ## Verify all tools are installed correctly
	@echo "Verifying installation..."
	@docker exec $(CONTAINER_NAME) /bin/bash -c "node --version && echo '✓ Node.js installed'"
	@docker exec $(CONTAINER_NAME) /bin/bash -c "bun --version && echo '✓ Bun installed'"
	@docker exec $(CONTAINER_NAME) /bin/bash -c "cre --version && echo '✓ CRE installed'"
	@docker exec $(CONTAINER_NAME) /bin/bash -c "mdbook --version && echo '✓ mdBook installed'"

env-setup: ## Create .env template file in workspace
	@mkdir -p workspace
	@if [ ! -f workspace/.env ]; then \
		echo "Creating .env template..."; \
		echo "# Chainlink Masterclass Environment Variables" > workspace/.env; \
		echo "# Add your keys here" >> workspace/.env; \
		echo "" >> workspace/.env; \
		echo "GEMINI_API_KEY=your_gemini_api_key_here" >> workspace/.env; \
		echo "PUSHOVER_USER_KEY=your_pushover_user_key_here" >> workspace/.env; \
		echo "PUSHOVER_APP_KEY=your_pushover_app_key_here" >> workspace/.env; \
		echo "" >> workspace/.env; \
		echo "# Wallet info (DO NOT COMMIT WITH REAL VALUES)" >> workspace/.env; \
		echo "PRIVATE_KEY=your_wallet_private_key_here" >> workspace/.env; \
		echo "BASE_SEPOLIA_RPC=https://sepolia.base.org" >> workspace/.env; \
		echo "✓ Created workspace/.env - please fill in your keys"; \
	else \
		echo "✓ workspace/.env already exists"; \
	fi

status: ## Show container status
	@echo "Container Status:"
	@docker ps -a -f name=$(CONTAINER_NAME) --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

copy-to-container: ## Copy files from workspace to container
	@echo "Copying workspace files to container..."
	docker cp workspace/. $(CONTAINER_NAME):/workspace/
	@echo "✓ Files copied"

copy-from-container: ## Copy files from container to workspace
	@echo "Copying files from container to workspace..."
	docker cp $(CONTAINER_NAME):/workspace/. workspace/
	@echo "✓ Files copied"