# Color
## 1. 功能介绍
> An immutable 32 bit color value in ARGB format.

一个 ARGB 格式的不可变的 32 位颜色值。

考虑一个浅绿色的 Flutter 图标，它是完全不透明的，带有红色通道值0x32(66)，绿色通道值0xA5(165)，蓝色通道值0xF5(245)，在颜色值的通用“哈希语法”中，它会被描述为 “#42A5F5”。

以下方式可以将其构造出来：
```dart
Color c = const Color(0xFF42A5F5);
Color c = const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5);
Color c = const Color.fromARGB(255, 66, 165, 245);
Color c = const Color.fromRGBO(66, 165, 245, 1.0);

```

如果你碰到一个颜色不能显示的问题，请检查以确保指定了完整的 8 个十六进制数字。如果你只指定 6 个，则假设前 2 位为零，表示完全透明。
```dart
Color c1 = const Color(0xFFFFFF); // 不可见的完全透明白色
Color c2 = const Color(0xFFFFFFFF); // 可见的完全不透明的白色
```

[参考 Material 设计规范中对颜色的定义](https://docs.flutter.io/flutter/material/Colors-class.html)

## 2. 继承关系
```dart
Color
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
