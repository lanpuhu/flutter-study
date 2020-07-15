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

每个 [RenderBox]（提供组件的布局模型的对象）从其父级接收 [BoxConstraints]，然后对其每个子级进行布局，然后选择一个满足 [BoxConstraints] 的 [Size]。

渲染对象的位置独立于其子对象的位置。通常，父组件会使用子组件的尺寸来决定他们的位置。一个子组件不知道它的位置并且当其位置发生变化的时候也不需要重新布局和重新渲染。

### 1.2 术语
在一个轴上的最小约束和最大约束相等时，称为紧约束。

最小约束是 0.0 称为松约束（不管最大约束的值）。如果最大约束也是 0.0，则这个轴上同时是紧约束和松约束。

最大约束不是无限值的时候，称为有界约束。

最大约束是无限值的时候，称为无界约束。最小约束和最大约束都是无限值的时候，也就是紧约束无限值，称为扩展约束。

最小约束是无限的，也就是说最大约束也是无限的。

## 2. 继承关系
```dart
BoxConstraints -> Constraints
```

## 3. 关键成员
### 3.1 构造函数
```dart
const BoxConstraints({
  this.minWidth = 0.0,
  this.maxWidth = double.infinity,
  this.minHeight = 0.0,
  this.maxHeight = double.infinity,
});

// 使用指定尺寸来创建一个边界约束
const BoxConstraints.tight(Size size)
  : minWidth = size.width,
    maxWidth = size.width,
    minHeight = size.height,
    maxHeight = size.height;

// 使用指定宽高来创建一个边界约束
const BoxConstraints.tightFor({
  double width,
  double height,
}) : minWidth = width ?? 0.0,
     maxWidth = width ?? double.infinity,
     minHeight = height ?? 0.0,
     maxHeight = height ?? double.infinity;

// 使用指定尺寸来创建一个边界约束，限制其大小不能超过这个尺寸
BoxConstraints.loose(Size size)
  : minWidth = 0.0,
    maxWidth = size.width,
    minHeight = 0.0,
    maxHeight = size.height;

// 创建一个边界约束来填充另外一个边界约束
const BoxConstraints.expand({
  double width,
  double height,
}) : minWidth = width ?? double.infinity,
     maxWidth = width ?? double.infinity,
     minHeight = height ?? double.infinity,
     maxHeight = height ?? double.infinity;
```
### 3.2 成员变量

## 4. 相关类
