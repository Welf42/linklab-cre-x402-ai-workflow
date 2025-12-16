# LinkLab CRE + x402 + AI Workflow

End-to-end demo for the **LinkLab Masterclass: Intro to Chainlink Runtime Environment (CRE) with x402 and AI**, showing how to build an AI-powered agent on **Chainlink Runtime Environment (CRE)** that runs on **Base Sepolia**, uses **x402** for agentic USDC payments, **Gemini** as the LLM, and **Pushover** for real-time notifications. [web:1][web:18]

This repo is designed so you can follow along with the masterclass and then extend the workflow afterward.

---

## What this demo covers

- Spinning up a **CRE** agent using Node.js/Bun. [web:1]
- Connecting the agent to **Base Sepolia** with test ETH and USDC. [web:1]
- Using **x402** to perform agentic payments in USDC. [web:1]
- Using **Gemini LLM** to decide when and how to pay. [web:1]
- Sending **Pushover** notifications when workflows trigger. [web:1]

---

## Tech stack

- **Runtime:** Chainlink Runtime Environment (CRE)  
- **Chain:** Base Sepolia testnet  
- **Payments:** Coinbase x402 (USDC on Base Sepolia)  
- **LLM:** Gemini API  
- **Notifications:** Pushover  
- **Language:** TypeScript (Node.js or Bun) [web:1]

---

## Prerequisites

Make sure you have these set up before running the demo (these match the masterclass prerequisites). [web:1]

- Node.js v18+ or Bun v1.3+ installed  
- CRE installed and configured  
- Wallet configured for **Base Sepolia**  
- Base Sepolia ETH (from Coinbase faucet)  
- Base Sepolia USDC (from Circle faucet)  
- Gemini LLM API key  
- Pushover User Key and Application Key  
- Optional: `mdBook` installed to read LinkLab docs locally [web:1]

---

## Installation

