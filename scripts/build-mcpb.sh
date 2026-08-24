#!/usr/bin/env bash
# Assembles the MCPB desktop-extension bundle (paretostudio-mcp.mcpb).
#
# Usage: scripts/build-mcpb.sh <app-repo-root>
#   <app-repo-root> is a paretostudio-v2 checkout where `npm run build:mcp`
#   has already produced dist/mcp/server.mjs.
#
# The bundle ships server.mjs plus its one external runtime dependency (zod —
# see tsup.mcp.config.ts in the app repo, which bundles everything else).
# zod is copied from the app repo's node_modules so the bundle matches the
# exact version the lockfile resolved (zod has zero transitive dependencies).
set -euo pipefail

APP="${1:?usage: scripts/build-mcpb.sh <app-repo-root>}"
cd "$(dirname "$0")/.."

[ -f "$APP/dist/mcp/server.mjs" ] || { echo "ERROR: $APP/dist/mcp/server.mjs not found — run 'npm run build:mcp' in the app repo first" >&2; exit 1; }
[ -d "$APP/node_modules/zod" ] || { echo "ERROR: $APP/node_modules/zod not found — run 'npm install' in the app repo first" >&2; exit 1; }

rm -rf extension/server paretostudio-mcp.mcpb
mkdir -p extension/server/node_modules
cp "$APP/dist/mcp/server.mjs" extension/server/server.mjs
cp -R "$APP/node_modules/zod" extension/server/node_modules/zod

npx --yes @anthropic-ai/mcpb pack extension paretostudio-mcp.mcpb

echo
echo "SHA-256:"
shasum -a 256 paretostudio-mcp.mcpb
