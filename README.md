# Valkey Docker Container Image

[![Build Status](https://github.com/wodby/valkey/workflows/Build%20docker%20image/badge.svg)](https://github.com/wodby/valkey/actions)
[![Docker Pulls](https://img.shields.io/docker/pulls/wodby/valkey.svg)](https://hub.docker.com/r/wodby/valkey)
[![Docker Stars](https://img.shields.io/docker/stars/wodby/valkey.svg)](https://hub.docker.com/r/wodby/valkey)

## Docker Images

❗For better reliability we release images with stability tags (
`wodby/valkey:9-X.X.X`) which correspond to [git tags](https://github.com/wodby/valkey/releases). We strongly recommend using images only with stability tags.

Overview:

- All images are based on Alpine Linux
- Base image: [valkey/valkey](https://github.com/valkey-io/valkey-container)
- [GitHub actions builds](https://github.com/wodby/valkey/actions)
- [Docker Hub](https://hub.docker.com/r/wodby/valkey)

[_(Dockerfile)_]: https://github.com/wodby/valkey/tree/master/Dockerfile

Supported tags and respective `Dockerfile` links:

- `9.0`, `9`, `latest` [_(Dockerfile)_]
- `8.1`, `8` [_(Dockerfile)_]
- `8.0` [_(Dockerfile)_]
- `7.2`, `7` [_(Dockerfile)_]

All images built for `linux/amd64` and `linux/arm64`

## Environment Variables

| Variable                           | Default Value           | Description                                                                                      |
|------------------------------------|-------------------------|--------------------------------------------------------------------------------------------------|
| `VALKEY_ACTIVE_REHASHING`          | `yes`                   |                                                                                                  |
| `VALKEY_APPENDONLY`                | `yes`                   | Used only when `VALKEY_SAVE_TO_DISK` set                                                         |
| `VALKEY_APPENDFSYNC`               | `everysec`              |                                                                                                  |
| `VALKEY_DATABASES`                 | `16`                    |                                                                                                  |
| `VALKEY_DBFILENAME`                | `dump.rdb`              |                                                                                                  |
| `VALKEY_LATENCY_MONITOR_THRESHOLD` | `0`                     |                                                                                                  |
| `VALKEY_LIST_MAX_ZIPLIST_ENTRIES`  | `512`                   |                                                                                                  |
| `VALKEY_LIST_MAX_ZIPLIST_VALUE`    | `64`                    |                                                                                                  |
| `VALKEY_LOGFILE`                   |                         |                                                                                                  |
| `VALKEY_LUA_TIME_LIMIT`            | `5000`                  |                                                                                                  |
| `VALKEY_MAXMEMORY`                 | `128m`                  |                                                                                                  |
| `VALKEY_MAXMEMORY_POLICY`          | `allkeys-lru`           |                                                                                                  |
| `VALKEY_MAXMEMORY_SAMPLES`         | `3`                     |                                                                                                  |
| `VALKEY_NOTIFY_KEYSPACE_EVENTS`    |                         |                                                                                                  |
| `VALKEY_PASSWORD`                  |                         |                                                                                                  |
| `VALKEY_SAVE_TO_DISK`              |                         | When set to any value valkey will save data to disk, by default hybrid method (both RDB and AOF) |
| `VALKEY_SAVES`                     | `900:1/300:10/60:10000` | Used only when `VALKEY_SAVE_TO_DISK` set                                                         |
| `VALKEY_SET_MAX_INTSET_ENTRIES`    | `512`                   |                                                                                                  |
| `VALKEY_SLOWLOG_MAX_LEN`           | `32`                    |                                                                                                  |
| `VALKEY_SLOWLOG_SLOWER_THAN`       | `10000`                 |                                                                                                  |
| `VALKEY_TCP_BACKLOG`               | `511`                   |                                                                                                  |
| `VALKEY_TCP_KEEPALIVE`             | `60`                    |                                                                                                  |
| `VALKEY_TIMEOUT`                   | `300`                   |                                                                                                  |

## Orchestration Actions

Usage:

```
make COMMAND [params ...]
 
commands:
    check-ready host max_try wait_seconds delay_seconds
    flushall host
    
default params values:
    host localhost
    max_try 1
    wait_seconds 1
    delay_seconds 0
```

## Deployment

Deploy Valkey to your server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com/).
