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
待展示的图片。

#### double size
图标的逻辑像素尺寸。图标占据一个正方形，宽高都等于 size。默认值是当前 [IconTheme] 尺寸，如果没有 [IconTheme]，或者其没有指定一个明确的值，则默认值为 24.0。

如果这个 [Icon] 被用在一个 [IconButton] 中，则使用 [IconButton.iconSize] 来替代，这样 [IconButton] 就可以使活动区域具有适当的大小。[IconButton] 使用 [IconTheme] 来传递尺寸 到 [Icon] 中。

#### Color color
渲染图标的时候使用的颜色。默认值由当前的 [IconTheme] 来决定。给定的颜色会适配当前 [IconTheme] 中指定的不透明度。

在材质主题中，如果 [Theme] 中没有指定 [IconTheme]，图标颜色默认为：深色主题图标为白色；浅色主题图标为黑色。

如果没有指定 [IconTheme] 和 [Theme]，则图标默认为黑色。

通常情况下，一个材质设计，颜色都会被使用到，例如：
```dart
Icon(
  icon: Icons.widgets,
  color: Colors.blue.shade400,
);
```

#### String semanticLabel
图标的语义标签，在辅助模式中使用，在 UI 中不展示。

## 4. 相关类
