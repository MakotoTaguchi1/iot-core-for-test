# iot-core-for-test

## 手順

### 1. アプリケーション側で利用するクレデンシャル情報の出力

```bash
# 証明書の保存
$ terraform output -raw certificate_pem > certs/certificate.pem.crt
# 秘密鍵の保存
$ terraform output -raw private_key > certs/private.pem.key
```

### 2. IoT Core 側でメッセージを受けていることの確認

アプリケーションから IoT Core トピック宛にパブリッシュしたときに確認する方法。
AWS コンソールの `MQTT テストクライアント` にて、以下トピックのサブスクライブを追加するとリアルタイムで確認できる。

```bash
# status-update
charging-stations/+/state-updates

# availability (Heartbeat)
charging-stations/+/availability
```

### 3. IoT Core からのメッセージパブリッシュ

remote-control (remoteStartTransaction)のパブリッシュ例

トピック名

```bash
charging-stations/11/remote-control/start-transaction
```

ペイロード

```json
{
  "request": {
    "evseId": 1,
    "idToken": {
      "idToken": "TEST001",
      "type": "ISO14443"
    },
    "remoteStartId": 1
  }
}
```
