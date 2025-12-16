# Setup

npm install --save-dev @types/node

# Complete Repository Setup Files

## 1. Root Files

### README.md
```markdown
# LinkLab CRE + x402 + AI Workflow

End-to-end demo for the **LinkLab Masterclass: Intro to Chainlink Runtime Environment (CRE) with x402 and AI**, showing how to build an AI-powered agent on **Chainlink Runtime Environment (CRE)** that runs on **Base Sepolia**, uses **x402** for agentic USDC payments, **Gemini** as the LLM, and **Pushover** for real-time notifications.

This repo is designed so you can follow along with the masterclass and then extend the workflow afterward.

## 🎯 What this demo covers

- Spinning up a **CRE** agent using Node.js/Bun
- Connecting the agent to **Base Sepolia** with test ETH and USDC
- Using **x402** to perform agentic payments in USDC
- Using **Gemini LLM** to decide when and how to pay
- Sending **Pushover** notifications when workflows trigger

## 🛠️ Tech stack

- **Runtime:** Chainlink Runtime Environment (CRE)
- **Chain:** Base Sepolia testnet
- **Payments:** Coinbase x402 (USDC on Base Sepolia)
- **LLM:** Gemini API
- **Notifications:** Pushover
- **Language:** TypeScript (Node.js or Bun)

## 📋 Prerequisites

Complete the checklist in [TODO.md](./TODO.md) before the masterclass. Essential requirements:

- ✅ Node.js v18+ or Bun v1.3+ installed
- ✅ CRE installed and configured
- ✅ Wallet configured for **Base Sepolia**
- ✅ Base Sepolia ETH (from Coinbase faucet)
- ✅ Base Sepolia USDC (from Circle faucet)
- ✅ Gemini LLM API key
- ✅ Pushover User Key and Application Key
- 📱 Optional: Pushover mobile app for live notifications

## 🚀 Quick Start

### 1. Clone and install

```bash
git clone <your-repo-url>
cd linklab-cre-x402-ai-workflow
npm install
# or
bun install
```

### 2. Configure environment

```bash
cp .env.example .env
```

Edit `.env` with your keys:

```env
# Wallet
PRIVATE_KEY=your_private_key_here
WALLET_ADDRESS=your_wallet_address_here

# Network
BASE_SEPOLIA_RPC=https://sepolia.base.org
CHAIN_ID=84532

# x402
X402_ENDPOINT=https://x402.base.org
X402_API_KEY=your_x402_api_key

# Gemini LLM
GEMINI_API_KEY=your_gemini_api_key

# Pushover
PUSHOVER_USER_KEY=your_pushover_user_key
PUSHOVER_APP_KEY=your_pushover_app_key

# Agent Config
USDC_THRESHOLD=10
PAYMENT_AMOUNT=1
CHECK_INTERVAL=60000
```

### 3. Verify setup

```bash
npm run verify
# or
bun run verify
```

### 4. Run the agent

```bash
npm run dev
# or
bun run dev
```

## 📁 Project Structure

```
.
├── src/
│   ├── agent/           # Main agent logic and policies
│   │   ├── index.ts     # Agent entrypoint
│   │   └── policies.ts  # Decision policies
│   ├── chain/           # Base Sepolia connection
│   │   └── index.ts     # RPC and balance checks
│   ├── llm/             # Gemini integration
│   │   └── index.ts     # LLM client
│   ├── notify/          # Pushover notifications
│   │   └── index.ts     # Notification client
│   ├── x402/            # x402 payments
│   │   └── index.ts     # Payment execution
│   └── index.ts         # Main entrypoint
├── docs/                # LinkLab documentation
├── .env.example         # Environment template
├── package.json         # Dependencies
└── tsconfig.json        # TypeScript config
```

## 🔄 Workflow Overview

1. **Agent starts** and connects to CRE
2. **Checks balances** on Base Sepolia (ETH + USDC)
3. **Evaluates policy** based on current state
4. **Asks Gemini LLM** for decision
5. **Executes payment** via x402 if approved
6. **Sends notification** via Pushover with results

## 📚 Resources

- [CRE Documentation](https://docs.chain.link/cre)
- [Base Sepolia Network Info](https://docs.base.org/network-information)
- [x402 Protocol Docs](https://docs.chain.link/cre/x402)
- [Gemini API Guide](https://ai.google.dev/gemini-api/docs)
- [Pushover API](https://pushover.net/api)

## 🎓 Masterclass Details

**Date:** December 16, 2025  
**Time:** 3:00–5:00 PM ET  
**YouTube:** [Watch Live](https://www.youtube.com/watch?v=r7VKS5L47f0)

## 🛠️ Troubleshooting

See [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) for common issues.

## 📝 License

MIT

---

**Ready for the masterclass! 🚀**
```

### .env.example
```env
# Wallet Configuration
PRIVATE_KEY=your_private_key_here
WALLET_ADDRESS=your_wallet_address_here

# Base Sepolia Network
BASE_SEPOLIA_RPC=https://sepolia.base.org
CHAIN_ID=84532

# x402 Configuration
X402_ENDPOINT=https://x402.base.org
X402_API_KEY=your_x402_api_key

# Gemini LLM
GEMINI_API_KEY=your_gemini_api_key

# Pushover Notifications
PUSHOVER_USER_KEY=your_pushover_user_key
PUSHOVER_APP_KEY=your_pushover_app_key

# Agent Configuration
USDC_THRESHOLD=10
PAYMENT_AMOUNT=1
CHECK_INTERVAL=60000
DEBUG=true
```

### package.json
```json
{
  "name": "linklab-cre-x402-ai-workflow",
  "version": "1.0.0",
  "description": "AI-powered agent on CRE with x402 payments",
  "main": "src/index.ts",
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/index.ts",
    "start": "tsx src/index.ts",
    "verify": "tsx scripts/verify-setup.ts",
    "build": "tsc",
    "test": "echo \"No tests yet\""
  },
  "keywords": [
    "chainlink",
    "cre",
    "x402",
    "base",
    "ai",
    "gemini"
  ],
  "dependencies": {
    "@chainlink/cre-sdk": "latest",
    "dotenv": "^16.3.1",
    "ethers": "^6.9.0",
    "axios": "^1.6.2"
  },
  "devDependencies": {
    "@types/node": "^20.10.5",
    "tsx": "^4.7.0",
    "typescript": "^5.3.3"
  }
}
```

### tsconfig.json
```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "lib": ["ES2022"],
    "moduleResolution": "node",
    "esModuleInterop": true,
    "strict": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "outDir": "./dist",
    "rootDir": "./src",
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

### .gitignore
```
# Dependencies
node_modules/
.pnp
.pnp.js

# Environment
.env
.env.local
.env.*.local

# Build
dist/
build/
*.tsbuildinfo

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Testing
coverage/

# CRE specific
.cre/
```

## 2. Source Files

### src/index.ts
```typescript
import 'dotenv/config';
import { startAgent } from './agent/index.js';
import { checkBalances } from './chain/index.js';
import { sendNotification } from './notify/index.js';

async function main() {
  console.log('🚀 Starting CRE Agent...');
  
  try {
    // Verify environment
    const requiredVars = [
      'PRIVATE_KEY',
      'BASE_SEPOLIA_RPC',
      'GEMINI_API_KEY',
      'PUSHOVER_USER_KEY',
      'PUSHOVER_APP_KEY'
    ];
    
    const missing = requiredVars.filter(v => !process.env[v]);
    if (missing.length > 0) {
      throw new Error(`Missing required environment variables: ${missing.join(', ')}`);
    }

    // Initial balance check
    console.log('💰 Checking balances...');
    const balances = await checkBalances();
    console.log('Balances:', balances);

    // Send startup notification
    await sendNotification(
      '🚀 Agent Started',
      `ETH: ${balances.eth}\nUSDC: ${balances.usdc}`
    );

    // Start the agent loop
    await startAgent();

  } catch (error) {
    console.error('❌ Error starting agent:', error);
    await sendNotification('❌ Agent Error', String(error));
    process.exit(1);
  }
}

main();
```

### src/agent/index.ts
```typescript
import { checkBalances } from '../chain/index.js';
import { getDecisionFromLLM } from '../llm/index.js';
import { sendPayment } from '../x402/index.js';
import { sendNotification } from '../notify/index.js';
import { evaluatePolicy } from './policies.js';

const CHECK_INTERVAL = parseInt(process.env.CHECK_INTERVAL || '60000');

export async function startAgent() {
  console.log('🤖 Agent loop started');
  console.log(`⏰ Check interval: ${CHECK_INTERVAL}ms`);

  async function runAgentCycle() {
    try {
      console.log('\n--- Agent Cycle Start ---');
      
      // 1. Get current state
      const balances = await checkBalances();
      console.log('💰 Balances:', balances);

      // 2. Evaluate policy
      const policyResult = evaluatePolicy(balances);
      console.log('📋 Policy:', policyResult);

      if (!policyResult.shouldConsultLLM) {
        console.log('⏭️  Policy says: skip this cycle');
        return;
      }

      // 3. Get LLM decision
      const llmDecision = await getDecisionFromLLM({
        balances,
        policyContext: policyResult.context
      });
      console.log('🧠 LLM Decision:', llmDecision);

      // 4. Execute payment if approved
      if (llmDecision.shouldPay) {
        const paymentResult = await sendPayment({
          recipient: llmDecision.recipient,
          amount: llmDecision.amount,
          asset: 'USDC'
        });

        console.log('💸 Payment result:', paymentResult);

        // 5. Send notification
        await sendNotification(
          '✅ Payment Executed',
          `Amount: ${llmDecision.amount} USDC\nTx: ${paymentResult.txHash}`
        );
      } else {
        console.log('⛔ LLM decided not to pay:', llmDecision.reason);
      }

    } catch (error) {
      console.error('❌ Error in agent cycle:', error);
      await sendNotification('❌ Agent Cycle Error', String(error));
    }
  }

  // Run immediately
  await runAgentCycle();

  // Then run on interval
  setInterval(runAgentCycle, CHECK_INTERVAL);
}
```

### src/agent/policies.ts
```typescript
interface Balances {
  eth: string;
  usdc: string;
}

interface PolicyResult {
  shouldConsultLLM: boolean;
  context: string;
}

const USDC_THRESHOLD = parseFloat(process.env.USDC_THRESHOLD || '10');

export function evaluatePolicy(balances: Balances): PolicyResult {
  const usdcBalance = parseFloat(balances.usdc);
  const ethBalance = parseFloat(balances.eth);

  // Policy 1: Must have enough ETH for gas
  if (ethBalance < 0.001) {
    return {
      shouldConsultLLM: false,
      context: 'Insufficient ETH for gas'
    };
  }

  // Policy 2: Must have USDC above threshold
  if (usdcBalance < USDC_THRESHOLD) {
    return {
      shouldConsultLLM: false,
      context: `USDC balance ${usdcBalance} below threshold ${USDC_THRESHOLD}`
    };
  }

  // All checks passed - consult LLM
  return {
    shouldConsultLLM: true,
    context: `ETH: ${ethBalance}, USDC: ${usdcBalance}, ready for payment decision`
  };
}
```

### src/chain/index.ts
```typescript
import { ethers } from 'ethers';

const RPC_URL = process.env.BASE_SEPOLIA_RPC || 'https://sepolia.base.org';
const WALLET_ADDRESS = process.env.WALLET_ADDRESS;

// Base Sepolia USDC contract address (you'll need to update this)
const USDC_ADDRESS = '0x036CbD53842c5426634e7929541eC2318f3dCF7e';

const USDC_ABI = [
  'function balanceOf(address) view returns (uint256)',
  'function decimals() view returns (uint8)'
];

export async function checkBalances() {
  const provider = new ethers.JsonRpcProvider(RPC_URL);
  
  // Get ETH balance
  const ethBalance = await provider.getBalance(WALLET_ADDRESS!);
  const ethFormatted = ethers.formatEther(ethBalance);

  // Get USDC balance
  const usdcContract = new ethers.Contract(USDC_ADDRESS, USDC_ABI, provider);
  const usdcBalance = await usdcContract.balanceOf(WALLET_ADDRESS!);
  const decimals = await usdcContract.decimals();
  const usdcFormatted = ethers.formatUnits(usdcBalance, decimals);

  return {
    eth: ethFormatted,
    usdc: usdcFormatted
  };
}

export async function getProvider() {
  return new ethers.JsonRpcProvider(RPC_URL);
}
```

### src/llm/index.ts
```typescript
import axios from 'axios';

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const GEMINI_ENDPOINT = `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${GEMINI_API_KEY}`;

interface LLMContext {
  balances: {
    eth: string;
    usdc: string;
  };
  policyContext: string;
}

interface LLMDecision {
  shouldPay: boolean;
  amount: number;
  recipient: string;
  reason: string;
}

export async function getDecisionFromLLM(context: LLMContext): Promise<LLMDecision> {
  const prompt = `You are an AI agent managing cryptocurrency payments on Base Sepolia testnet.

Current state:
- ETH Balance: ${context.balances.eth}
- USDC Balance: ${context.balances.usdc}
- Context: ${context.policyContext}

Decide whether to make a USDC payment. Consider:
1. Is there enough USDC available?
2. Is this a good time to make a payment?
3. What's an appropriate amount?

Respond with a JSON object:
{
  "shouldPay": boolean,
  "amount": number (in USDC),
  "recipient": "0x..." (address),
  "reason": "explanation"
}`;

  try {
    const response = await axios.post(GEMINI_ENDPOINT, {
      contents: [{
        parts: [{
          text: prompt
        }]
      }]
    });

    const text = response.data.candidates[0].content.parts[0].text;
    
    // Extract JSON from response (handling markdown code blocks)
    const jsonMatch = text.match(/\{[\s\S]*\}/);
    if (!jsonMatch) {
      throw new Error('No JSON found in LLM response');
    }

    const decision = JSON.parse(jsonMatch[0]);
    return decision;

  } catch (error) {
    console.error('Error calling Gemini API:', error);
    // Safe default: don't pay if LLM fails
    return {
      shouldPay: false,
      amount: 0,
      recipient: '',
      reason: 'LLM call failed'
    };
  }
}
```

### src/notify/index.ts
```typescript
import axios from 'axios';

const PUSHOVER_USER_KEY = process.env.PUSHOVER_USER_KEY;
const PUSHOVER_APP_KEY = process.env.PUSHOVER_APP_KEY;
const PUSHOVER_ENDPOINT = 'https://api.pushover.net/1/messages.json';

export async function sendNotification(title: string, message: string) {
  if (!PUSHOVER_USER_KEY || !PUSHOVER_APP_KEY) {
    console.log('📱 Pushover not configured, skipping notification');
    return;
  }

  try {
    await axios.post(PUSHOVER_ENDPOINT, {
      token: PUSHOVER_APP_KEY,
      user: PUSHOVER_USER_KEY,
      title,
      message,
      priority: 0
    });
    console.log('📱 Notification sent:', title);
  } catch (error) {
    console.error('Failed to send notification:', error);
  }
}
```

### src/x402/index.ts
```typescript
import axios from 'axios';

const X402_ENDPOINT = process.env.X402_ENDPOINT;
const X402_API_KEY = process.env.X402_API_KEY;

interface PaymentParams {
  recipient: string;
  amount: number;
  asset: string;
}

interface PaymentResult {
  success: boolean;
  txHash?: string;
  error?: string;
}

export async function sendPayment(params: PaymentParams): Promise<PaymentResult> {
  try {
    // This is a placeholder - actual x402 integration will be shown in the masterclass
    console.log('💸 Initiating x402 payment:', params);

    if (!X402_ENDPOINT || !X402_API_KEY) {
      throw new Error('x402 not configured');
    }

    const response = await axios.post(
      `${X402_ENDPOINT}/payment`,
      {
        recipient: params.recipient,
        amount: params.amount.toString(),
        asset: params.asset,
        chain: 'base-sepolia'
      },
      {
        headers: {
          'Authorization': `Bearer ${X402_API_KEY}`,
          'Content-Type': 'application/json'
        }
      }
    );

    return {
      success: true,
      txHash: response.data.txHash
    };

  } catch (error: any) {
    console.error('Payment failed:', error);
    return {
      success: false,
      error: error.message
    };
  }
}
```

## 3. Scripts

### scripts/verify-setup.ts
```typescript
import 'dotenv/config';
import { checkBalances } from '../src/chain/index.js';

async function verifySetup() {
  console.log('🔍 Verifying setup...\n');

  const checks = {
    env: false,
    node: false,
    balances: false
  };

  // Check Node version
  const nodeVersion = process.version;
  const major = parseInt(nodeVersion.slice(1).split('.')[0]);
  checks.node = major >= 18;
  console.log(`${checks.node ? '✅' : '❌'} Node.js version: ${nodeVersion} ${checks.node ? '(OK)' : '(Need v18+)'}`);

  // Check environment variables
  const requiredVars = [
    'PRIVATE_KEY',
    'WALLET_ADDRESS',
    'BASE_SEPOLIA_RPC',
    'GEMINI_API_KEY',
    'PUSHOVER_USER_KEY',
    'PUSHOVER_APP_KEY'
  ];

  const missing = requiredVars.filter(v => !process.env[v]);
  checks.env = missing.length === 0;
  console.log(`${checks.env ? '✅' : '❌'} Environment variables ${checks.env ? '(OK)' : `(Missing: ${missing.join(', ')})`}`);

  // Check balances
  if (checks.env) {
    try {
      const balances = await checkBalances();
      checks.balances = parseFloat(balances.eth) > 0;
      console.log(`${checks.balances ? '✅' : '❌'} Wallet balances:`);
      console.log(`   ETH: ${balances.eth}`);
      console.log(`   USDC: ${balances.usdc}`);
    } catch (error) {
      console.log(`❌ Failed to check balances: ${error}`);
    }
  }

  console.log('\n' + '='.repeat(50));
  const allPassed = Object.values(checks).every(v => v);
  if (allPassed) {
    console.log('✅ All checks passed! Ready for the masterclass! 🚀');
  } else {
    console.log('❌ Some checks failed. Please fix the issues above.');
    process.exit(1);
  }
}

verifySetup();
```

### TROUBLESHOOTING.md
```markdown
# Troubleshooting Guide

## Common Issues

### CRE Installation

**Issue:** `cre: command not found`

```bash
# Reinstall CRE
curl -sSL https://cre.chain.link/install.sh | bash

# Add to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH="$HOME/.cre/bin:$PATH"

# Reload shell
source ~/.bashrc  # or source ~/.zshrc
```

### Environment Variables

**Issue:** Missing environment variables

1. Make sure you copied `.env.example` to `.env`
2. Fill in all required values
3. Don't add quotes around values in `.env`

### Base Sepolia Connection

**Issue:** Cannot connect to Base Sepolia

```typescript
// Try alternative RPC endpoints
BASE_SEPOLIA_RPC=https://base-sepolia-rpc.publicnode.com
// or
BASE_SEPOLIA_RPC=https://sepolia.base.org
```

### Gemini API

**Issue:** 401 Unauthorized

1. Verify your API key is correct
2. Check if the key is active at https://aistudio.google.com/apikey
3. Ensure no extra spaces in `.env`

### Pushover Notifications

**Issue:** Not receiving notifications

1. Verify both User Key and App Key are correct
2. Install the Pushover mobile app
3. Test with: `curl -s --form-string "token=YOUR_APP_KEY" --form-string "user=YOUR_USER_KEY" --form-string "message=test" https://api.pushover.net/1/messages.json`

### Balance Checks

**Issue:** USDC balance shows 0

1. Verify you got USDC from Circle faucet for **Base Sepolia** (not mainnet!)
2. Check on block explorer: https://sepolia.basescan.org/address/YOUR_ADDRESS
3. Update USDC contract address in `src/chain/index.ts` if needed

## Getting Help

1. Check the masterclass YouTube chat
2. Review docs at https://docs.chain.link/cre
3. Reply to the event email to contact organizers
```