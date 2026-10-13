# SambaClient 固有の作業指示

- Dockerfile、README の利用方法、`version` はプロジェクト固有の内容として保持する。
- Docker Hub の token 参照は `secrets.DOCKERHUB_TOKEN || secrets.DOCKER_TOKEN` を保持する。テンプレート標準との差分は既存の secret 名への互換性のためで、資格情報や権限の変更は行わない。
- Docker 品質チェックは `.github/workflows/docker-quality-checks.yml` の build check、build、`smbclient --version` smoke test を使う。
- 手動検証、Docker 品質 CI、Docker Release CI の検証用 image に対する `smbclient --version` smoke test は、すべて `docker run --network none` で実行する。品質 CI の `LOCAL_IMAGE` と Release CI の `release-check` も対象とする。
- build check と build では、base image と Alpine パッケージの取得に必要なネットワークを許可する。smoke test のネットワーク隔離を build に適用しない。
- 実ユーザーの SMB 共有や資格情報に接続せずに検証する。

## 手動の Docker 品質チェック

専用 tag の検証用 image を作り、品質 CI と同じコマンドをネットワークなしで確認する。Release CI の smoke test も同じネットワーク条件で `smbclient --version` を直接実行する。

```sh
docker buildx build --check --file Dockerfile .
docker buildx build --load --file Dockerfile --tag samba-client-smoke:issue-14 .
docker run --rm --network none --entrypoint sh samba-client-smoke:issue-14 -eu -c 'smbclient --version'
docker run --rm --network none samba-client-smoke:issue-14 smbclient --version
```
