# BoxConstraints
## 1. 功能介绍
> Immutable layout constraints for [RenderBox] layout.

[RenderBox] 布局的不可修改的布局约束。

当且仅当以下关系成立时，设置的 [Size] 才是有效的：
* [minWidth] <= [Size.width] <= [maxWidth]
* [minHeight] <= [Size.height] <= [maxHeight]

约束本身也必须满足以下关系：
* 0 <= [minWidth] <= [maxWidth] <= [double.infinity]
* 0 <= [minHeight] <= [maxHeight] <= [double.infinity]

[double.infinity] 是一个合法的约束值。

### 1.1 盒子布局模型
Flutter 框架对渲染对象使用一遍布局模型进行布局，该模型会遍历渲染树并传递约束，然后返回渲染树的具体几何形状。

对于盒子，其约束为 [BoxConstraints]，如此处所述，由 4 个数字组成：最小宽度 [minWidth]、最大宽度 [maxWidth]、最小高度 [minHeight]、最大高度 [maxHeight]。

盒子的几何形状由 [Size] 组成，它必须满足上述约束。




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
