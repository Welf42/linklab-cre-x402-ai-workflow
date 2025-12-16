# TODO

## 1. Prerequisites setup checklist

### System and tooling

- [X] Install Node.js v18+ (or confirm `node -v` is ≥ 18).  
- [ ] Optionally install Bun v1.3+ (`bun -v`) if you want to use Bun.  
- [X] Install `git` and ensure GitHub account is ready.  

### Chainlink Runtime Environment (CRE)

- [ ] Follow the official instructions to install **CRE** on your machine. (https://docs.chain.link/cre/getting-started/cli-installation/macos-linux) --> curl -sSL https://cre.chain.link/install.sh | bash
- [ ] Verify CRE CLI or runtime runs correctly (e.g. `cre --help` or equivalent).   
)
- [ ] Create or configure a CRE project/agent workspace directory.  

### Base Sepolia network

- [ ] Add **Base Sepolia** network to your wallet (e.g. MetaMask) with the provided RPC and chain ID.  
- [ ] Copy your Base Sepolia wallet address for later use.  
- [ ] Request **Base Sepolia ETH** from Coinbase’s faucet to that address.  
- [ ] Request **Base Sepolia USDC** from Circle’s faucet to that same address.  
- [ ] Confirm ETH and USDC balances on a Base Sepolia block explorer.  

### API keys and services

- [X] Create or log into your **Gemini** account. (https://aistudio.google.com/api-keys)
- [X] Generate a **Gemini LLM API key** and store it securely.  
- [X] Create a **Pushover** account.   (https://pushover.net/signup)
- [X] Create a new Pushover **Application** and note the **Application Key**.  
- [X] Note your **Pushover User Key** from the dashboard.  
- [ ] Install the **Pushover mobile app** (optional but recommended to see live notifications).  

### Optional docs tooling

- [ ] Install **mdBook** so you can open the LinkLab docs locally (optional, but nice to have).  

### Project repo

- [ ] Create a new GitHub repository (e.g. `linklab-cre-x402-ai-workflow`).  
- [ ] Clone it locally and initialize Node/Bun project (`npm init` or `bun init`).  
- [ ] Add base folders: `src/agent`, `src/chain`, `src/x402`, `src/llm`, `src/notify`.  
- [ ] Create `.env.example` with all required environment variables.  

***

## 2. Masterclass session flow (what gets done)

Use this as a high-level roadmap of what happens during the LinkLab session and what you’ll implement in your repo.

### A. Environment and project bootstrap

- [ ] Confirm Node/Bun and CRE are working on your machine.  
- [ ] Scaffold a minimal TypeScript/JavaScript project for the CRE agent.  
- [ ] Wire up `npm run dev` / `npm run start` scripts (or Bun equivalents).  

### B. Connect to CRE and Base Sepolia

- [ ] Configure the CRE agent entrypoint (e.g. `src/index.ts`) to register with CRE.  
- [ ] Add Base Sepolia RPC configuration and helper functions in `src/chain`.  
- [ ] Implement basic checks at startup:  
  - [ ] Connect to CRE node.  
  - [ ] Fetch wallet address and onchain balances (ETH + USDC).  

### C. Integrate x402 for payments

- [ ] Add an x402 client module in `src/x402`.  
- [ ] Load x402 endpoint and API key from environment variables.  
- [ ] Implement a simple `sendPayment()` function that:  
  - [ ] Takes recipient, amount, and asset (USDC) as input.  
  - [ ] Calls x402 to execute a payment on Base Sepolia.  
- [ ] Add basic logging or return values so you can see payment status.  

### D. Integrate Gemini LLM

- [ ] Add a Gemini client module in `src/llm`.  
- [ ] Load `GEMINI_API_KEY` from `.env`.  
- [ ] Implement a `getDecisionFromLLM(context)` or similar function that:  
  - [ ] Sends context (e.g. balances, user request) to Gemini.  
  - [ ] Gets back a structured or textual decision on whether to pay, how much, etc.  

### E. Integrate Pushover notifications

- [ ] Add a notification module in `src/notify`.  
- [ ] Load `PUSHOVER_USER_KEY` and `PUSHOVER_APP_KEY` from `.env`.  
- [ ] Implement a `sendNotification(title, message)` function that:  
  - [ ] Sends a push notification via Pushover.  
  - [ ] Is called after key events (e.g. payment success/failure).  

### F. Build the “agentic” workflow

- [ ] Define a simple **policy** in `src/agent/policies.ts`, such as:  
  - [ ] “If USDC balance is above threshold and LLM says yes, execute a payment.”  
  - [ ] Or “Pay-per-event”: only pay when a certain condition or trigger is met.  
- [ ] Implement a main agent loop or handler in `src/agent/index.ts` that:  
  - [ ] Periodically or event-wise collects context (balances, external inputs).  
  - [ ] Calls Gemini to evaluate and get a decision.  
  - [ ] If decision is positive, calls x402 to execute a USDC payment.  
  - [ ] Sends Pushover notification with result (success or failure + tx info).  

### G. Run end-to-end during the session

- [ ] Start the agent via CRE with your configured `.env`.  
- [ ] Trigger at least one full workflow live:  
  - [ ] Agent logs show LLM decision.  
  - [ ] Payment is sent through x402 on Base Sepolia.  
  - [ ] Pushover notification appears on your phone.  
- [ ] Optionally tweak parameters (amounts, thresholds, prompts) to see behavior changes.  
