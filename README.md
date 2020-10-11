# plugin_http_server

flutter调用golang代码，利于gomobile bind能力。

## 编译

### 安卓
- aar

```
cd go
gomobile bind -ldflags="-w -s" -o ../android/libs/server.aar -target=android ./server
```

- apk

```
flutter build apk
```
