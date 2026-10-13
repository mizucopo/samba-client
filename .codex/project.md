# SambaClient 固有の作業指示

- Dockerfile、README の利用方法、`version` はプロジェクト固有の内容として保持する。
- Docker Hub の token 参照は `secrets.DOCKERHUB_TOKEN || secrets.DOCKER_TOKEN` を保持する。テンプレート標準との差分は既存の secret 名への互換性のためで、資格情報や権限の変更は行わない。
- Docker 品質チェックは `.github/workflows/docker-quality-checks.yml` の build check、build、`smbclient --version` smoke test を使う。ローカルの検証用 image は専用 tag を付け、smoke test は `--network none` で実行する。
- 実ユーザーの SMB 共有や資格情報に接続せずに検証する。
