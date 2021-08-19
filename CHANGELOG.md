# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project follows [osixia/openldap](https://github.com/osixia/docker-openldap-backup) versioning.

## [1.5.1] - unpublished
### Changed
  - Upgrade awscli to recent version for better support of AWS EKS

## [1.5.0] - 2021-02-19
### Changed
  - Upgrade baseimage to openldap:1.5.0

## [1.4.0] - 2020-06-15
### Changed
  - Upgrade baseimage to openldap:1.4.0
  - Cron scripts now use logger cmd

## [1.3.0] - 2019-09-29
## Added
  - Multiarch support

### Changed
  - Upgrade baseimage to openldap:1.3.0

## [1.2.5] - 2019-08-16
### Changed
  - Upgrade baseimage to openldap:1.2.5

## [1.2.4] - 2019-03-14
### Changed
  - Upgrade baseimage to openldap:1.2.4

## [1.2.3] - 2019-01-21
### Added
  - Option to upload backups to S3 #7

### Changed
  - Upgrade baseimage to openldap:1.2.3

## [1.2.2] - 2018-09-04
### Changed
  - Upgrade baseimage to openldap:1.2.2

## [1.2.1] - 2018-05-14
### Changed
  - Upgrade baseimage to openldap:1.2.1

## [1.2.0] - 2018-03-05
### Changed
  - Upgrade baseimage to openldap:1.2.0

## [1.1.11] - 2017-12-21
### Changed
  - Upgrade baseimage to openldap:1.1.11

## [1.1.10] - 2017-12-12
### Changed
  - Upgrade baseimage to openldap:1.1.10

## [1.1.9] - 2017-07-19
### Changed
  - Upgrade baseimage to openldap:1.1.9

## [1.1.8] - 2017-02-16
### Changed
  - Upgrade baseimage to openldap:1.1.8

## [1.1.7] - 2016-11-09
### Changed
  - Upgrade baseimage to openldap:1.1.7
  - chmod 600 on backups

## [1.1.6] - 2016-09-02
### Changed
  - Now a mutliple process image based on osixia/openldap with slapd
  - Restore tools updated

## Versions before following the osixia/openldap versioning

## [0.1.11] - 2016-09-02
### Changed
  - Upgrade baseimage to openldap:1.1.6

## [0.1.10] - 2016-08-02
### Changed
  - Upgrade baseimage to openldap:1.1.5

## [0.1.9] - 2016-07-26
### Changed
  - Upgrade baseimage to openldap:1.1.4

## [0.1.8] - 2016-02-20
### Changed
  - Upgrade baseimage to openldap:1.1.1

## [0.1.7] - 2016-01-25
### Added
  - Makefile with build no cache

### Changed
  - Upgrade baseimage to openldap:1.1.0  

## [0.1.6] - 2015-11-20
### Changed
  - Upgrade baseimage to openldap:1.0.7

## [0.1.5] - 2015-11-20
### Changed
  - Upgrade baseimage to openldap:1.0.6

## [0.1.4] - 2015-11-19
### Changed
  - Upgrade baseimage to openldap:1.0.5

## [0.1.3] - 2015-11-06
### Changed
  - Upgrade baseimage to openldap:1.0.4

## [0.1.2] - 2015-10-26
### Changed
  - Upgrade baseimage to openldap:1.0.3

## [0.1.1] - 2015-08-18
### Changed
  - Upgrade baseimage to openldap:1.0.1
  - Rename environment variables

## 0.1.0 - 2015-07-24
Initial release

[1.5.0]: https://github.com/osixia/docker-openldap-backup/compare/v1.4.0...v1.5.0
[1.4.0]: https://github.com/osixia/docker-openldap-backup/compare/v1.3.0...v1.4.0
[1.3.0]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.5...v1.3.0
[1.2.5]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.4...v1.2.5
[1.2.4]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.3...v1.2.4
[1.2.3]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/osixia/docker-openldap-backup/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.11...v1.2.0
[1.1.11]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.10...v1.1.11
[1.1.10]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.9...v1.1.10
[1.1.9]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.8...v1.1.9
[1.1.8]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.7...v1.1.8
[1.1.7]: https://github.com/osixia/docker-openldap-backup/compare/v1.1.6...v1.1.7
[1.1.6]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.11...v1.1.6
[0.1.11]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.10...v0.1.11
[0.1.10]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.9...v0.1.10
[0.1.9]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.8...v0.1.9
[0.1.8]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/osixia/docker-openldap-backup/compare/v0.1.0...v0.1.1
