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

## 3. 基本信息
一个 32 位的值表示一个颜色值。24-31 表示 alpha；16-23 表示红色；8-15 表示绿色；0-7 表示蓝色。

## 4. 关键成员
### 4.1 构造函数
```dart
// 使用一个整数的低 32 位来表示一个颜色
const Color(int value) : value = value & 0xFFFFFFFF;

// 使用 4 个整数的低 8 位来表示一个颜色
const Color.fromARGB(int a, int r, int g, int b) :
  value = (((a & 0xFF) << 24) |
           ((r & 0xFF) << 16) |
           ((g & 0xFF) << 8)  |
           ((b & 0xFF) << 0)) & 0xFFFFFFFF;

// 使用红绿蓝和不透明度来表示一个颜色，类似于 CSS 中的 `rgba()`
const Color.fromRGBO(int r, int g, int b, double opacity) :
  value = ((((opacity * 0xFF ~/ 1) & 0xFF) << 24) |
            ((r & 0xFF) << 16) |
            ((g & 0xFF) << 8)  |
            ((b & 0xFF) << 0)) & 0xFFFFFFFF;
```
* a: alpha，范围为 [0, 255]
* r: 红色，范围为 [0, 255]
* g: 绿色，范围为 [0, 255]
* b: 蓝色，范围为 [0, 255]
* opacity: 不透明度，范围为 [0.0, 1.0]
