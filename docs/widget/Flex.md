# Flex 组件
## 1. 功能介绍
> A widget that displays its children in a one-dimensional array.

以一维数组的形式显示其子组件的组件。

Flex 组件允许你件沿着轴（水平或竖直）放置子组件。这个轴被称为主轴。如果你事先知道主轴，那么可以考虑使用 Row 或者 Column 组件，这样代码就显得不那么冗长了。

如果想让子组件扩展并填充组件主轴上的所有可用空间，请将子组件包装在 Expanded 组件中。

Flex 组件不能滚动，通常，子组件超过组件的可容纳范围被认为是错误的。如果你有一些组件，并希望它们在空间不足时能够滚动，请考虑使用 ListView。

如果你只有一个子组件，考虑使用 Align 或 Center 来放置子组件，而不是使用 Flex、Row、Column。

### 布局逻辑
本节描述了框架如何渲染 Flex。

Flex 布局分六步进行：
1. 按照不受限制的主轴约束条件和传入的交叉轴约束条件，对 flex 为 null 或 0 的 子组件进行布局。如果交叉轴对齐方式为 CrossAxisAlignment.stretch，则使用与传入的交叉轴最大范围相匹配的严格交叉轴约束条件。
2. 根据弹性系数，将主轴剩余空间分配给非零弹性系数的子控件。例如一个拥有 2.0 弹性系数的子组件所拥有的主轴空间是一个拥有 1.0 弹性系数的子组件所拥有的主轴空间的两倍。
3. 按照步骤 1 的方式将剩余子组件在交叉轴上进行布局，但是不要使用无限制的主轴约束条件，而是使用基于步骤 2 中分配的空间的主轴约束条件。具有 Flexible.tight 属性的子组件具有严格的约束，具有 Flexiable.fit 属性的子组件具有宽松的约束。
4. 交叉轴的范围是所有子组件交叉轴范围的最大值。
5. 主轴的范围由 mainAxisSize 属性决定。如果 mainAxisSize 是 MainAxisSize.max，则主轴的范围是传入的主轴约束的最大范围。如果 mainAxisSize 是 MainAxisSize.min，则主轴的范围是所有子组件的主轴范围的最大值。
6. 根据 mainAxisAlignment 和 crossAxisAlignment 来决定每个子组件的位置。例如，如果 mainAxisAlignment 是 MainAxisAlignment.spaceBetween，则主轴还没有被分配的空间将会被均匀地划分并分布在子组件之间。

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
