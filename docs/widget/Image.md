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

// 通过网络资源创建一个图像组件
Image.network(
  String src, {
  Key key,
  double scale = 1.0,
  ...
  Map<String, String> headers,
}) : image = NetworkImage(src, scale: scale, headers: headers),
     ...
     super(key: key);

// 通过文件创建一个图像组件
// Android 系统上可能会请求 “android.permission.READ_EXTERNAL_STORAGE” 权限
Image.file(
  File file, {
  Key key,
  double scale = 1.0,
  ...
}) : image = FileImage(file, scale: scale)
     ...
     super(key: key);

// 通过资源包创建一个图像组件，图像组件的 key 由 name 参数给出
// 当显示包中的图像时，package 参数必须是非空的，否则为空。
// 如果 bundle 参数被省略或者为空，[DefaultAssetBundle] 会被使用。
// 默认情况下 ，将使用像素密度可感知的图像资源解析。此外：
// 1. 如果提供了 scale 参数并且不空，则精确的资源将会被使用，如果要显示指定的密度的图像，必须提供确切的路径，例如 images/2x/cat.png
// 2. [name] 和 [repeat] 参数不能为空
// 假设工程中的 pubspec.yaml 包含以下内容
// flutter:
//   assets:
//     - images/cat.png
//     - images/2x/cat.png
//     - images/3.5x/cat.png
// 在设备像素比为 2.0 的设备上，以下代码将会渲染 images/2x/cat.png 文件：
Image.asset('images/cat.png');
// 对应的文件是工程中的 images/2x/ 目录下的名字为 cat.png 文件，路径相对于 pubspec.yaml 文件。
// 在设备像素比为 4.0 的设备上，images/3.5x/cat.png 文件会被使用。在设备像素比为 1.0 的设备上，images/cat.png 文件会被使用。
// 图片 images/cat.png 图片可以从磁盘中省略，尽管其必须在清单中体现。如果它被省略，那么设备像素比为 1.0 的设备，images/2x/cat.png 文件会被替代使用。
// TODO


```
### 3.2 成员变量
#### ImageProvider image
待展示的图像。

#### ImageFrameBuilder frameBuilder
一个构造器函数，负责创建代表该图像的组件。

如果该变量为空，该组件会在图像可用的时候立即展示图像的第一帧。调用者可以使用这个构造器向图像添加效果（例如图像可用时淡入）或者在图像的加载过程中展示一个占位符。

如果想对用户呈现更细粒度的图像加载进度，请参考 [loadingBuilder]。

如果还为图像组件指定了 [loadingBuilder]，则两个构造器将连接在一起，当前构造器的结果将被以 child 参数传递给 [loadingBuilder]。例如，考虑以下结合使用的构造器：

```dart
Image(
  ...
  frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: child,
    );
  },
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
    return Center(child: child);
  },
)
```
这个例子中，组件层次结构将包含以下内容：
```dart
Center(
  child: Padding(
    padding: EdgeInsets.all(8.0),
    child: <image>,
  ),
)
```

以下示例演示了如何使用此构建器来实现加载后的淡入效果：
```dart
@override
Widget build(BuildContext context) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Image.network(
      'https://example.com/image.jpg',
      frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          child: child,
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
        );
      }
    ),
  );
}
```

#### ImageLoadingBuilder loadingBuilder
一个构造器，它指定了图像在加载过程中，如何向用户展示。

如果该变量为空，并且这个图像是逐步加载的（例如从网络加载），用户就不能收到这个图像的字节加载进度。

如果图像指定了 [loadingBuilder]，那么 [Image] 组件会在每一个渲染管线帧上去重建，直到这个图片被加载完毕。这对于显示加载进度的情况很有用，但对于更简单的情况，例如展示一个占位符，它并不依赖于加载进度，例如静态文本“加载”，[frameBuilder] 可能会更有用，并且没有那么多的消耗。

```dart
Widget build(BuildContext context) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Image.network(
      'https://example.com/image.jpg',
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress != null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ?
              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
              : null,
          ),
        );
      }
    ),
  );
}
```

#### double width & height
如果不为空，图像组件使用该宽度和高度。如果为空，则选择其固有尺寸。

强烈建议同时制定 [width] 和 [height]，或者将组建放在严格约束的上下文中，这样图像在加载时不会改变其大小。如果实现不知道确切的图像尺寸，请考虑使用 [fit] 来适配图像的渲染。

#### Color color
如果为非空，则会使用 [colorBlendMode] 来将图像的每个像素点与该颜色进行混合。

#### BlendMode colorBlendMode
与 [color] 结合使用。默认值是 BlendMode.srcIn。在混合模式方面，[color] 是源，图像是目标。

#### FilterQuality filterQuality
使用 [FilterQuality.low] 双线性差值来缩放图像。使用 [FilterQuality.none] 最近邻点。

#### BoxFit fit
如何在布局过程中将图像渲染在分配的空间中。

#### AlignmentGeometry alignment
如何在图像组件范围内对齐图像。

对齐属性将给定的位置与布局边界中给定的位置对齐。

#### ImageRepeat repeat
如何绘制布局边界没有被覆盖到的区域。

#### Rect centerSlice
点 9 图片的中心切片。

中心切片内的图像区域将水平和垂直拉伸，以使图像适合其目标。中心切片上方和下方的图像区域仅水平拉伸，中心切片左侧和右侧的图像区域仅垂直拉伸。

#### bool gaplessPlaback
当图像提供者改变时，是继续显示旧图像，还是暂时不显示任何图像。

## 4. 相关类
