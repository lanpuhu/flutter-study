# Image 组件
## 1. 功能介绍
> A widget that displays an image.

展示一张图片的组件。

提供几种构造函数来使用不同的方式展示图片。
* [new Image] 通过一个 [ImageProvider] 来创建图片组件。
* [new Image.asset] 通过一个 [AssetBundle] 和一个 key 来创建图片组件。
* [new Image.network] 通过一个 URL 来创建图片组件。
* [new Image.file] 通过一个 [File] 来创建图片组件。
* [new Image.memory] 通过一个 [Uint8List] 来创建图片组件。

要自动执行像素密度可感知的资源解决方案，请使用 [AssetImage]，并确保 [MaterialApp], [WidgetsApp] 或 [MediaQuery] 组件处于 [Image] 上层。

默认构造函数可以使用任意 [ImageProvider]，例如 [NetworkImage] 来展示一张从网上来的图片。
```dart
const Image(
  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg),
);
```

[Image] 组件也提供了一系列构造函数来方便的展示不同类型的图片。例如使用 [Image.network] 构造函数来展示一张从网上来的图片。
```dart
Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg');
```

## 2. 继承关系
```dart
Image -> StatefulWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个图片组件
const Image({
  Key key,
  @required this.image,
  this.frameBuilder,
  this.loadingBuilder,
  this.semanticLabel,
  this.excludeFromSemantics = false,
  this.width,
  this.height,
  this.color,
  this.colorBlendMode,
  this.fit,
  this.alignment = Alignment.center,
  this.repeat = ImageRepeat.noRepeat,
  this.centerSlice,
  this.matchTextDirection = false,
  this.gaplessPlayback = false,
  this.filterQuality = FilterQuality.low,
}) : assert(image != null),
     assert(alignment != null),
     assert(repeat != null),
     assert(filterQuality != null),
     assert(matchTextDirection != null),
     super(key: key);
```
### 3.2 成员变量
#### ImageProvider image
待展示的图像。

#### ImageFrameBuilder frameBuilder
一个构造器函数，负责创建代表该图像的组件。

如果该变量为空，该组件会在图像可用的时候立即展示图像的第一帧。调用者可以使用这个构造器向图像添加效果（例如图像可用时淡入）或者在图像的加载过程中展示一个占位符。

## 4. 相关类
