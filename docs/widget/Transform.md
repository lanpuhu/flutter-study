# Transform 组件
## 1. 功能介绍
> A widget that applies a transformation before painting its child.

绘制子组件之前先做一次转换的组件。

Transform 组件与 [RotatedBox] 组件不同，后者在布局之前就应用了旋转，而前者只在绘制之前应用变换。这意味着这个组件在计算需要消耗多大空间时，是不应用这个变换的。

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
```
### 3.2 成员变量
#### AlignmentGeometry alignment
非定位的子组件的对齐方式。

#### Overflow overflow
超出边界的子组件是否被裁剪

## 4. 相关类
