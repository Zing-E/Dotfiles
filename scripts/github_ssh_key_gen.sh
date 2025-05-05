#!/bin/sh

EMAIL="ethantidmore@proton.me"
KEY_NAME="github_key"
USER_NAME="Zing-E"

mkdir -p "$HOME/.ssh" 2>/dev/null

ssh-keygen -t ed25519 -C "$EMAIL" -f "$HOME/.ssh/$KEY_NAME"

eval "$(ssh-agent -s)"
ssh-add "$HOME/.ssh/$KEY_NAME"

echo "Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$KEY_NAME" > "$HOME/.ssh/config"

chmod 700 "$HOME/.ssh" 2>/dev/null
chmod 600 "$HOME/.ssh/config" 2>/dev/null
