# Icon 组件
## 1. 功能介绍
> A graphical icon widget drawn with a glyph from a font described in an [IconData] such as material's predefined [IconData]s in [Icons].

从 [IconData] 中描述的字体来绘制字体字形的组件，例如材质主题中预定义的 [Icons]。

[Icon] 组件是不可交互的，如果需要一个可交互的 [Icon] 组件，考虑材质主题中的 [IconButton]。

使用 [Icon] 组件的时候，其周围必须要有一个 [Directionality] 的组件。通常，这是由 [WidgetsApp] 自动引入的，或者 [MaterialApp]。

此组件假定图标都是正方形的，非正方形的图标可能会显示错误。

此实例说明如何创建一行不同颜色和大小的图标。第一个图标使用 [semanticLabel] 来说明辅助模式，例如语音提示或者旁白。
```dart
Container(
  color: Colors.black,
  child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color(0xFFE8581C),
      child: const Text('Apartment for rent!'),
    ),
  ),
)
```

## 2. 继承关系
```dart
Transform -> SingleChildRenderObjectWidget -> RenderObjectWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
const Transform({
  Key key,
  @required this.transform,
  this.origin,
  this.alignment,
  this.transformHitTests = true,
  Widget child,
}) : assert(transform != null),
     super(key: key, child: child);

// 将子组件绕其中心顺时针旋转一定角度
Transform.rotate({
  Key key,
  @required double angle,
  this.origin,
  this.alignment = Alignment.center,
  this.transformHitTests = true,
  Widget child,
}) : transform = Matrix4.rotationZ(angle),
     super(key: key, child: child);

// 将子组件平移一定距离
Transform.translate({
  Key key,
  @required Offset offset,
  this.transformHitTests = true,
  Widget child,
}) : transform = Matrix4.translationValues(offset.dx, offset.dy, 0.0),
     origin = null,
     alignment = null,
     super(key: key, child: child);

// 将子组件均匀缩放一定比例
Transform.scale({
  Key key,
  @required double scale,
  this.origin,
  this.alignment = Alignment.center,
  this.transformHitTests = true,
  Widget child,
}) : transform = Matrix4.diagonal3Values(scale, scale, 1.0),
     super(key: key, child: child);
```
### 3.2 成员变量
#### Matrix4 transform
渲染子组件过程中用到的矩阵

#### Offset origin
应用矩阵的系统坐标原点，相对于父组件的左上角。

#### AlignmentGeometry alignment
原点的对齐方式，相对于盒子的大小。

## 4. 相关类
