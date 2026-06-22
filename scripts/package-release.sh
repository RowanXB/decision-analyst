#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="decision-analyst"
VERSION="${1:-v0.1.0}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/.tmp/package-skill"
DIST_DIR="$ROOT_DIR/dist"
ZIP_PATH="$DIST_DIR/${SKILL_NAME}-${VERSION}.zip"

echo "Packaging ${SKILL_NAME} ${VERSION}..."

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/$SKILL_NAME"
mkdir -p "$DIST_DIR"

copy_if_exists() {
  local path="$1"

  if [ -e "$ROOT_DIR/$path" ]; then
    cp -R "$ROOT_DIR/$path" "$BUILD_DIR/$SKILL_NAME/"
  else
    echo "Warning: $path not found, skipping."
  fi
}

# Runtime / documentation files included in the release package
copy_if_exists "SKILL.md"
copy_if_exists "README.md"
copy_if_exists "LICENSE"
copy_if_exists "test-prompts.json"
copy_if_exists "references"
copy_if_exists "agents"

# Remove macOS metadata if present
find "$BUILD_DIR" -name ".DS_Store" -delete

rm -f "$ZIP_PATH"

(
  cd "$BUILD_DIR"
  zip -r "$ZIP_PATH" "$SKILL_NAME" \
    -x "*.DS_Store" \
    -x "__MACOSX/*"
)

echo
echo "Created:"
echo "$ZIP_PATH"
echo
echo "ZIP contents:"
unzip -l "$ZIP_PATH"

rm -rf "$BUILD_DIR"