# SambaClinet

SAMBAの設定テスト用のDockerImageです。

## build

```sh
docker build -t mizucopo/smbclient-alpine:lastest .
```

## run

```sh
docker run --rm -it mizucopo/smbclient-alpine:lastest
```

## test

```sh
smbclient //192.168.1.21/homes -U mizu
```
