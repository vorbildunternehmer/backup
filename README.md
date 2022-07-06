# Automatische Backups mit Borg

Backups sind wichtig. Mit diesem Skript lassen sich Backups automatisiert im Docker-Container durchführen. Verwendet wird die Technologie von Borg-Backup.

## Installation

#### docker-compose.yml
```yml
services:
  borg:
    ...
    volumes:
      - '{PATH1}:{DOCKERPATH1}'
      - '{PATH2}:{DOCKERPATH2}'

```

#### .env

```bash
BORG_PASSPHRASE='{PASSPHRASE}'
REPO='{REPONAME}'
FILES='{DOCKERPATH1} {DOCKERPATH2} ...'
```
