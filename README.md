# SambaClient

SAMBAの設定テスト用のDockerImageです。

## build

```sh
docker build -t mizucopo/samba-client:latest .
```

## run

```sh
docker run --rm -it mizucopo/samba-client:latest
```

## test

```sh
smbclient //192.168.1.21/homes -U mizu
```
