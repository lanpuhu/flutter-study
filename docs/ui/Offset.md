# Offset
## 1. 功能介绍
> An immutable 2D floating-point offset.

一个不可改变的 2D 浮点偏移量。

一般来说，可以用两种方式来解释偏移量：
1. 代表笛卡尔坐标系中的一个点，与单独维护的原点的距离。例如，在 [RenderBox] 协议中，子节点的左上角通常表示为其与父节点左上角的偏移量。
2. 作为一个可以应用于坐标的向量。例如，在绘制 [RenderObject] 时，父节点会传递一个相对于屏幕原点的偏移量，它可以添加到子节点的偏移量中来找到子节点相对于屏幕原点的位置。

## 2. 继承关系
```dart
Offset -> OffsetBase
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个偏移量
// dx: 水平分量
// dy: 垂直分量
const Offset(double dx, double dy) : super(dx, dy);

// 根据方向和距离创建偏移量
// direction: 从 x 轴正方向顺时针的弧度
// distance: 可选参数，默认创建单位向量
factory Offset.fromDirection(double direction, [ double distance = 1.0 ]) {
  return Offset(distance * math.cos(direction), distance * math.sin(direction));
}
```
