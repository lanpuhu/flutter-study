# Alignment 属性
## 1. 功能简介
> A point within a rectangle.

矩形中的一个点，用来表示矩形中的位置，常与 [Alin](../widget/Align.md) 组件配合使用。

Alignment(0.0, 0.0) 表示矩形的中心点。从 [-1.0, 1.0] 的距离表示从矩形的一边到另外一边。因此，水平方向或垂直方向上的 2.0 等于这个矩形的宽度和高度。

## 2. 继承关系
```
Alignment -> AlignmentGeometry
```

## 3. 基本规则
如果矩形的宽高分表表示为 w 和 h，则 Alignment(x, y) 在坐标系统中表示矩形中的点 (x * w / 2 + w / 2, y * h / 2 + h / 2)。

## 4. 源码解析
### 4.1 构造函数
```
const Alignment(this.x, this.y)
```
* x: 水平方向上的位置
* y: 垂直方向上的位置

## 5 使用方式
### 5.1 创建对象
```
Alignment(0.1, 0.2),
```

### 5.2 常用快捷方式
Flutter SDK 中提供了几个常用的点位，可以直接使用。
```
/// The top left corner.
static const Alignment topLeft = Alignment(-1.0, -1.0);

/// The center point along the top edge.
static const Alignment topCenter = Alignment(0.0, -1.0);

/// The top right corner.
static const Alignment topRight = Alignment(1.0, -1.0);

/// The center point along the left edge.
static const Alignment centerLeft = Alignment(-1.0, 0.0);

/// The center point, both horizontally and vertically.
static const Alignment center = Alignment(0.0, 0.0);

/// The center point along the right edge.
static const Alignment centerRight = Alignment(1.0, 0.0);

/// The bottom left corner.
static const Alignment bottomLeft = Alignment(-1.0, 1.0);

/// The center point along the bottom edge.
static const Alignment bottomCenter = Alignment(0.0, 1.0);

/// The bottom right corner.
static const Alignment bottomRight = Alignment(1.0, 1.0);
```