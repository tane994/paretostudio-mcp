# Security Policy

## Reporting a vulnerability

Email **support@paretostudio.io** (see also
[paretostudio.io/.well-known/security.txt](https://paretostudio.io/.well-known/security.txt)).
Please include reproduction steps and do not open a public issue for
security-sensitive reports. We aim to acknowledge within 72 hours.

## Supported versions

Only the latest version published on npm
([`paretostudio-mcp`](https://www.npmjs.com/package/paretostudio-mcp)) is
supported. The recommended install (`npx -y paretostudio-mcp@latest`) always
runs the latest release.

## Scope

This repository is the public distribution home of the package (manifest,
examples, documentation, and the MCPB desktop-extension bundle). The server
source lives in the ParetoStudio application repository; vulnerabilities in the
published bundle, the ParetoStudio API, or the web app are all in scope for the
address above.

## What the server can do

The server is a local stdio process that talks only to the ParetoStudio API
with the API key you configure. Write and delete tools operate on your
ParetoStudio library; `install_*` tools write files into the project directory
you point them at (never outside it — paths are validated against traversal and
symlink escape). Treat your `psk_` API key as a secret: it grants read, write,
and delete access to your library until revoked in Settings → Developer.
