# plugin_http_server

flutter 调用 golang 代码，利用 go 强大的交叉编译来实现 flutter 上所有平台对应的支持。

## 编译动态库

使用命令行进入项目`go`目录，所有 go 的交叉编译都必须在此目录进行。

```
cd go
```

### 安卓

- aar

```
gomobile bind -ldflags="-w -s" -o ../android/libs/gopeed.aar -target=android -javapkg=com.gopeed.core ./bind/mobile
```

### windows

- dll

```
go build -ldflags="-w -s" -buildmode=c-shared -o ../windows/libs/gopeed.dll ./bind/desktop
```

- apk

```
flutter build apk
```

## dart binding 代码生成

dart 官方提供了`ffigen`项目，可以根据`.h`头文件自动生成对应的绑定代码，此功能需要安装`LLVM`。

### 首次使用需要 setup

```
flutter pub run ffigen:setup -Ipath/to/llvm/include -Lpath/to/llvm/lib
```

### 代码生成

```
flutter pub run ffigen
```

## 构建应用

此项目为插件项目，`example`目录为应用目录，可以进行打包编译。

```
cd example
```

### 安卓

```
flutter build apk
```

### windows

```
# 把动态库复制到应用目录中
rm -rf ./windows/libs/gopeed.dll
cp ../windows/libs/gopeed.dll ./windows/libs/gopeed.dll
flutter build windows
```
