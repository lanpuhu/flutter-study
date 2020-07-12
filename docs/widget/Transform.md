# Transform 组件
## 1. 功能介绍
> A widget that applies a transformation before painting its child.

绘制子组件之前先做一次转换的组件。

Transform 组件与 [RotatedBox] 组件不同，后者在布局之前就应用了旋转，而前者只在绘制之前应用变换。这意味着这个组件在计算需要消耗多大空间时，是不应用这个变换的。

以下示例将一个包含文字的橙色盒子旋转并斜切，保持右上角与原始位置固定。
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
