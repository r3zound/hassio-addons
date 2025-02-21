# Changelog

## [v2.2.2] - 2023-10-01

### Added
- Initial release of EasyTier addon
- Support for ARM64 and AMD64 architectures
- Configuration via options.json
- Automatic config.yaml generation
- TUN device support
- Network configuration options:
  - instance_name
  - instance_id
  - rpc_portal
  - network_name
  - network_secret
  - uri
  - cidr

### Changed
- Base image updated to easytier/easytier:v2.2.2
- Added jq package for JSON parsing

### Fixed
- Initialization script improvements
- Configuration file handling
