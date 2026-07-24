#!/usr/bin/env bash
set -euo pipefail

ROOT="$(dirname "$(dirname "$(realpath "$0")")")"

echo "Syncing root source files to docs/..."

cp "$ROOT/README.md" "$ROOT/docs/index.mdx"
sed -i 's|(CONTRIBUTING.md)|(/contributing)|g; s|(CODE_OF_CONDUCT.md)|(/code-of-conduct)|g' "$ROOT/docs/index.mdx"
echo "  README.md -> docs/index.mdx"

mkdir -p "$ROOT/docs/code-of-conduct"
cp "$ROOT/CODE_OF_CONDUCT.md" "$ROOT/docs/code-of-conduct/index.mdx"
sed -i 's|(CONTRIBUTING.md)|(/contributing)|g; s|(CODE_OF_CONDUCT.md)|(/code-of-conduct)|g' "$ROOT/docs/code-of-conduct/index.mdx"
echo "  CODE_OF_CONDUCT.md -> docs/code-of-conduct/index.mdx"

mkdir -p "$ROOT/docs/contributing"
cp "$ROOT/CONTRIBUTING.md" "$ROOT/docs/contributing/index.mdx"
sed -i 's|(CONTRIBUTING.md)|(/contributing)|g; s|(CODE_OF_CONDUCT.md)|(/code-of-conduct)|g' "$ROOT/docs/contributing/index.mdx"
echo "  CONTRIBUTING.md -> docs/contributing/index.mdx"

echo "Done."
