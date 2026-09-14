# AGENTS.md

Instructions for AI agents working in this repository.

## Start Here

Read [`README.md`](./README.md) first — it documents the image hierarchy, which
images are actually built by CI, the versioning/tagging scheme, and the build
system. Do not modify Dockerfiles or the CI pipeline without understanding it.

## Key Facts

- Every push to `main` triggers a full rebuild/publish of the 7 CI-managed images.
  Any change to shared files (`release`, `versions`, `Makefile`, `basic-env/`)
  republishes everything — keep changes intentional.
- The root `release` file is the single source of truth for the published tag.
- Images inheriting `basic-env:${RELEASE}` (no `-$(ARCHITECTURE)` suffix) cannot
  be built by CI; see the README inventory table before adding dependencies on them.

## Working Rules

- Never commit credentials (`.dockerhub_username`, `.dockerhub_password`).
- After changing a Dockerfile or Makefile target, validate with a local build of
  that single module (`./build-module.sh <image>`) before pushing.
- Bump the `release` file as part of any change that should reach published images.
