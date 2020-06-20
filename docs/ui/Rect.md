# Rect
## 1. 功能介绍
> An immutable, 2D, axis-aligned, floating-point rectangle whose coordinates are relative to a given origin.

一个不可变的、二维的、与轴对齐的浮点矩形，其坐标相对于给定的原点。

一个矩形可以使用其构造函数创建，或偏移量和尺寸通过 `&` 符号创建。

```dart
Rect rect = const Offset(1.0, 2.0) & const Size(3.0, 4.0);
```

## 2. 继承关系
```dart
Rect
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 根据左上右下四个边创建一个矩形
const Rect.fromLTRB(this.left, this.top, this.right, this.bottom)
  : assert(left != null),
    assert(top != null),
    assert(right != null),
    assert(bottom != null);

// 根据左上两个边和宽高创建一个矩形
const Rect.formLTWH(double left, double top, double width, double height)
 : this.fromLTRB(left, top, left + width, top + bottom);

// 根据中心点和宽高创建一个矩形
Rect.fromCenter({Offset center, double width, double height})
  : this.fromLTRB(
    center.dx - width / 2,
    center.dy - height / 2,
    center.dx + width / 2,
    center.dy + height / 2
  );

// 根据中心点和半径创建一个矩形
Rect.fromCircle({Offset center, double radius}) : this.fromCenter(
  center: center,
  width: radius * 2.0,
  height: radius * 2.0
);

// 根据两个点构建一个矩形，该矩形包含这两个点，且是最小的
Rect.fromPoints(Offset a, Offset b) : this.fromLTRB(
  math.min(a.dx, b.dx),
  math.min(a.dy, b.dy),
  math.max(a.dx, b.dx),
  math.max(a.dy, b.dy)
);
```
