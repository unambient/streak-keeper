alias clippy := backend-lint

# run both projects in development
[parallel]
dev: backend-dev frontend-dev

# run both projects as release
[parallel]
run: backend-run frontend-run

# run clippy with pendantic lints on the backend
[working-directory: 'backend']
backend-lint:
    cargo clippy -- -Wclippy::pedantic

# run backend in development
[working-directory: 'backend']
backend-dev:
    watchexec -e rs -r cargo run

# run backend (release)
[working-directory: 'backend']
backend-run:
    cargo run --release

# run frontend in development
[working-directory: 'frontend']
frontend-dev:
    deno task dev --open

# build and run preview
[working-directory: 'frontend']
frontend-run:
    deno task build
    deno task preview
