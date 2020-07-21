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


## 2. 继承关系
```dart
Icon -> StatelessWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个 Icon，[size] 和 [color] 的默认值是由当前 [IconTheme] 给定的。
const Icon(
  this.icon, {
    Key key,
    this.size,
    this.color,
    this.semanticLabel,
    this.textDirection,
}) : super(key: key);
```
### 3.2 成员变量
#### IconData icon
需要展示的图标，可用的图标都被定义在 [Icons] 里面。该值可以为空，在这种场景下会使用指定尺寸绘制一个空白区域。

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
