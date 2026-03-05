# Homebrew Tap: Agentic Engineering Framework

Homebrew tap for the [Agentic Engineering Framework](https://github.com/DimitriGeelen/agentic-engineering-framework) — governance for AI coding agents.

## Install

```bash
brew tap DimitriGeelen/agentic-fw
brew install fw
```

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
brew upgrade fw
```

## Uninstall

```bash
brew uninstall fw
brew untap DimitriGeelen/agentic-fw
```
