# plugin_http_server

flutter调用golang代码，利于gomobile bind能力。

## 编译

### 安卓
- aar

```
cd go
gomobile bind -ldflags="-w -s" -o ../android/libs/gopeed.aar -target=android -javapkg=com.gopeed.core ./bind/mobile
```

- apk

```
flutter build apk
```

### windows
- dll

```
cd go
go build -ldflags="-w -s" -buildmode=c-shared -o ../windows/libs/gopeed.dll ./bind/desktop
flutter pub run ffigen:setup -Ipath/to/llvm/include -Lpath/to/llvm/lib
flutter pub run ffigen
```

