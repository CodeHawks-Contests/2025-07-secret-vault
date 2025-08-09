# First Flight #46: Secret Vault on Aptos


## Contest Details

Starts: August 14, 2025 Noon UTC

Ends: August 06, 2025 Noon UTC

### Stats
- nSLOC: 30
- Complexity Score: 15

[//]: # (contest-details-open)

## About

This will be the first in a series of First Flights featuring move on Aptos!

### This challenge teaches several important security concepts:

- How Move handles ownership 
- Understanding how Move handles account authentication differently from Solidity
- Global storage vs contract storage
- Resource safety implications
- Event emission patterns

SecretVault is a Move smart contract application for storing a secret on the Aptos blockchain. Only the owner should be able to store a secret and then retrieve it later. Others should not be able to access the secret.

### Roles
Owner - Only the owner may set and retrieve their secret

[//]: # (contest-details-close)

[//]: # (getting-started-open)

## Getting Started

## Requirements
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [Aptos CLI](https://aptos.dev/tools/aptos-cli/)
  - You'll know you did it right if you can run `aptos --version` and you see a response like `aptos 3.x.x`
- [Move](https://aptos.dev/move/move-on-aptos/)

## Quickstart

```bash
git clone https://github.com/CodeHawks-Contests/2025-07-secret-vault.git
cd 2025-07-secret-vault
aptos move compile --dev
```

## Usage

### Deploy (local)
1. Start a local Aptos node
```bash
aptos node run-local-testnet --with-faucet
```

2. Initialize your account
```bash
aptos init --profile local --network local
```

3. Deploy
```bash
aptos move publish --profile local
```

## Testing
```bash
aptos move test
```

[//]: # (getting-started-close)

[//]: # (scope-open)

## Scope
- In Scope:
```
./sources/
└── secret_vault.move
./Move.toml
```

## Compatibilities
- Move Version: Latest
- Chain(s) to deploy contract to: Aptos Mainnet/Testnet
- Aptos CLI Version: 3.x.x

[//]: # (scope-close)

## Known Issues

[//]: # (known-issues-open)

<p align="center">
No known issues reported.
</p>

[//]: # (known-issues-close)
