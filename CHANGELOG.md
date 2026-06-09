# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.3] - 2026-06-09

### Added
- `audit` Mix alias bundling `deps.audit` and `hex.audit`.
- GitHub Actions CI workflow.

### Changed
- Bumped `doctor` to `~> 0.23.0`.
- Bumped `req` to `~> 0.6`.
- Moved `mix_test_watch` to the `:dev` environment with `runtime: false`.
- Loaded `config/dev.secret.exs` only when present.

## [0.2.2] - 2025-03-18

### Changed
- Restricted `credo` to `:dev` and `:test` with `runtime: false`.
- Restricted `excoveralls` to `:test` with `runtime: false`.

## [0.2.1] - 2025-03-17

### Changed
- Credo cleanup and refactor pass.

## [0.2.0]

### Added
- Domain and email integration tests.

### Changed
- Refactored HTTP GET error handling.
- Refactored HTTP GET queries.
- Project description in `mix.exs`.
- README updates.

## [0.1.0]

### Added
- Initial release: `ExUserCheck.Emails.check/1` and `ExUserCheck.Domains.check/1`.

[0.2.3]: https://github.com/docJerem/ex_user_check/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/docJerem/ex_user_check/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/docJerem/ex_user_check/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/docJerem/ex_user_check/releases/tag/v0.2.0
