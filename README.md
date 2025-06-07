# SambaClient

このリポジトリでは、Sambaの設定をテストするためのDockerイメージを提供します。
smbclientコマンドで指定のサーバに接続する試験環境が必要な時に利用できます。
このコンテナはAlpine Linuxベースで、smbclientのみをインストールしています。

## 必要環境
- Docker がインストールされた環境

## イメージの取得
Docker Hubから最新版を取得する場合は次のコマンドを実行します。
```sh
docker pull mizucopo/samba-client:latest
```

## ビルド
```sh
docker build -t mizucopo/samba-client:latest .
```

## 実行
```sh
docker run --rm -it mizucopo/samba-client:latest
```

## 使用例
以下はローカル環境でsmbclientを使って接続を試す例です。
```sh
smbclient //192.168.1.21/homes -U mizu
```

## ライセンス
このプロジェクトは [MIT License](LICENSE) のもとで公開しています。
