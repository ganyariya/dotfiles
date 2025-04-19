# Prerequisite

Install git.

# Setup

### Mac

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply ganyariya
```

### Linux

```bash
apt update && \
  apt install -y curl git zsh && \
  chsh -s /usr/bin/zsh && \
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply ganyariya
```

# Forcely refresh archives

```bash
chezmoi apply --init --refresh-externals
```
