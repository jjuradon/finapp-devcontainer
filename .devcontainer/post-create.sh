#!/bin/bash
set -e

echo "🚀 Starting post-create setup for finapp repositories..."

# Create finapp repos directory
REPOS_DIR="$HOME/finapp-repos"
mkdir -p "$REPOS_DIR"

echo "📁 Repositories will be cloned to: $REPOS_DIR"

# Array of repositories to clone
REPOS=(
  "jjuradon/finapp-backend"
  "jjuradon/finapp-web"
  "jjuradon/finapp-mobile"
  "jjuradon/finapp-gitops"
)

# Clone each repository
for REPO in "${REPOS[@]}"; do
  REPO_NAME=$(echo "$REPO" | cut -d'/' -f2)
  REPO_PATH="$REPOS_DIR/$REPO_NAME"
  
  if [ -d "$REPO_PATH" ]; then
    echo "✓ $REPO_NAME already exists, skipping clone"
  else
    echo "⬇️  Cloning $REPO..."
    gh repo clone "$REPO" "$REPO_PATH"
    echo "✓ Successfully cloned $REPO"
  fi
done

echo ""
echo "✅ Post-create setup complete!"
echo ""
echo "📂 Repository locations:"
for REPO in "${REPOS[@]}"; do
  REPO_NAME=$(echo "$REPO" | cut -d'/' -f2)
  echo "   - $REPOS_DIR/$REPO_NAME"
done
echo ""
echo "💡 Tip: All repositories are available in $REPOS_DIR"
