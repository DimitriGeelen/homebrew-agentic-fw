# Homebrew Tap: Agentic Engineering Framework

Homebrew tap for the [Agentic Engineering Framework](https://github.com/DimitriGeelen/agentic-engineering-framework) — governance for AI coding agents.

## Install

```bash
brew install DimitriGeelen/agentic-fw/agentic-fw
```

Or tap first, then install:

```bash
brew tap DimitriGeelen/agentic-fw
brew install agentic-fw
```

> **Note:** The CLI command is `fw`, the Homebrew formula is `agentic-fw` (to avoid collision with [brocode/fw](https://github.com/brocode/fw) in Homebrew core).

## Usage

```bash
# Initialize in your project
cd your-project
fw init

# Start working
fw work-on "Fix the bug" --type build

# Check compliance
fw audit

# End session
fw handover --commit
```

## Update

```bash
brew update
brew upgrade agentic-fw
```

## Migrating from `fw` formula

If you previously installed as `fw` and got the wrong package (brocode/fw), run:

```bash
brew uninstall fw
brew install DimitriGeelen/agentic-fw/agentic-fw
```

## Uninstall

```bash
brew uninstall agentic-fw
brew untap DimitriGeelen/agentic-fw
```
