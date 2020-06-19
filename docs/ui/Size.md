# Size
## 1. 功能介绍
> Holds a 2D floating-point size.

持有一个 2D 浮点尺寸。

可以将其视为距离原点的偏移量。

## 2. 继承关系
```dart
Size -> OffsetBase
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个指定宽高的尺寸
const Size(double width, double height) : super(width, height);

// 数据拷贝
Size.copy(Size source) : super(source.width, source.height);

// 创建一个宽高相等的尺寸
const Size.square(double dimension) : super(dimension, dimension);

// 创建一个指定半径的尺寸
const Size.fromRadius(double radius) : super(radius * 2.0, radius * 2.0);
```
