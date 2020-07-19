# Icon 组件
## 1. 功能介绍
> A graphical icon widget drawn with a glyph from a font described in an [IconData] such as material's predefined [IconData]s in [Icons].

从 [IconData] 中描述的字体来绘制字体字形的组件，例如材质主题中预定义的 [Icons]。

[Icon] 组件是不可交互的，如果需要一个可交互的 [Icon] 组件，考虑材质主题中的 [IconButton]。

使用 [Icon] 组件的时候，其周围必须要有一个 [Directionality] 的组件。通常，这是由 [WidgetsApp] 自动引入的，或者 [MaterialApp]。

此组件假定图标都是正方形的，非正方形的图标可能会显示错误。

此实例说明如何创建一行不同颜色和大小的图标。第一个图标使用 [semanticLabel] 来说明辅助模式，例如语音提示或者旁白。
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: const <Widget>[
    Icon(
      Icons.favorite,
      color: Colors.pink,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
    Icon(
      Icons.audiotrack,
      color: Colors.green,
      size: 30.0,
    ),
    Icon(
      Icons.beach_access,
      color: Colors.blue,
      size: 36.0,
    ),
  ],
);
```

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
图标的语义标签

## 4. 相关类
