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

可参考：
* [Row] 组件的水平方向的版本。
* [Column] 组件的垂直方向版本。
* [Expanded] 表明子组件需要充满所有剩余空间。
* [Flexible] 表明子组件需要分享剩余空间。
* [Spacer] 一个占用的空间大小与其 flex 值成比例的组件，尺寸可能比较小。

## 2. 继承关系
```dart
Flex -> MultiChildRenderObjectWidget -> RenderObjectWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个 Flex 布局
// direction 是必要参数
// direction, mainAxisAlignment, mainAxisSize, verticalDirection 参数不能为空，如果 crossAxisAlignment 是 CrossAxisAlignment.baseline 那么 textBaseline 不能为空
Flex({
  Key key,
  @required this.direction,
  this.mainAxisAlignment = MainAxisAlignment.start,
  this.mainAxisSize = MainAxisSize.max,
  this.crossAxisAlignment = CrossAxisAlignment.center,
  this.textDirection,
  this.verticalDirection = VerticalDirection.down,
  this.textBaseline,
  List<Widget> children = const <Widget>[],
}) : assert(direction != null),
     assert(mainAxisAlignment != null),
     assert(mainAxisSize != null),
     assert(crossAxisAlignment != null),
     assert(verticalDirection != null),
     assert(crossAxisAlignment != CrossAxisAlignment.baseline || textBaseline != null),
     super(key: key, children: children);
```

### 3.2 成员变量
#### [Axis](#44-Axis) direction
主轴的方向。

#### [MainAxisAlignment](#41-MainAxisAlignment) mainAxisAlignment
子组件在主轴上的对齐方式。

#### [MainAxisSize](#43-MainAxisSize) mainAxisSize
主轴上应该占多少空间，给子组件分配空间以后，可能还有一些剩余的自由空间。
该值用来控制传入的布局约束是最大化还是最小化可用空间。
如果有子组件有非零弹性因子，而且没有一个适合的 FlexFit.loose，它们将扩展并消耗所有的可用空间，这样就没有剩余可用空间来设置布局约束最大化或最小化，最终的布局就跟这个值无关。

#### [CrossAxisAlignment](#42-CrossAxisAlignment) crossAxisAlignment
子组件在侧轴上的对齐方式。

#### textDirection
决定子组件在水平方向上的顺序，以及如何在水平方向上解析开始和结束。

#### verticalDirection
决定子组件在垂直方向上的顺序，以及如何在垂直方向上解析开始和结束。

#### textBaseline
指定组件的对齐基线。

## 4. 相关类
### 4.1 MainAxisAlignment
子组件在 Flex 布局中主轴上的对齐方式。

#### start
将子组件尽可能地放置在靠近主轴的起始位置。

如果在水平方向上使用此值，[TextDirection] 必须要指定以确定起始位置是左侧还是右侧。

如果在垂直方向上使用此值，[VerticalDirection] 必须要指定以确定起始位置是上边还是下边。

#### end
将子组件尽可能地放置在靠近主轴的结束位置。

如果在水平方向上使用此值，[TextDirection] 必须要指定以确定结束位置是左侧还是右侧。

如果在垂直方向上使用此值，[VerticalDirection] 必须要指定以确定结束位置是上边还是下边。

#### center
将子组件尽可能地放置在靠近主轴的中心位置。

#### spaceBetween
将剩余空间均匀地分布在子组件之间。

#### spaceAround
将剩余空间均匀地分布在子组件之间，并且第一个组件之前和最后一个组件之后各占均分的空间的一半。

#### spaceEvenly
将剩余空间均匀地分布在子组件之间，包括第一个组件之前和最后一个组件之后。

### 4.2 CrossAxisAlignment
子组件在 Flex 布局中侧轴上的对齐方式。

#### start
将子组件的起始边缘与侧轴的起始位置对齐。

如果在水平方向上使用此值，[TextDirection] 必须要指定以确定起始位置是左侧还是右侧。

如果在垂直方向上使用此值，[VerticalDirection] 必须要指定以确定起始位置是上边还是下边。

#### end
将子组件尽可能放置在侧轴的结束位置。

如果在水平方向上使用此值，[TextDirection] 必须要指定以确定结束位置是左侧还是右侧。

如果在垂直方向上使用此值，[VerticalDirection] 必须要指定以确定结束位置是上边还是下边。

#### center
将子组件的中心与侧轴的中心对齐。

#### stretch
将子组件在侧轴方向填满。这将导致传递给子组件的约束在侧轴上是严格的。

#### baseline
将子组件在侧轴方向匹配它们的基线。如果主轴是垂直的，那么这个值将会被当做 start，因为基线始终是水平的。

### 4.3 MainAxisSize
主轴应该占用多少空间。

在弹性布局过程中，将主轴上的可用空间分配给子组件。分配空间后，可能还有一些剩余空间。该值控制是否根据传入的布局约束来最大化或最小化可用空间。

#### min
最小化主轴上的可用空间，具体取决于传入的布局约束。

如果传入的布局约束具有足够大的 [BoxConstraints.minWidth] 或 [BoxConstraints.minHeight]，可能仍然存在非零的可用空间。

如果传入的布局约束是无限制的，并且任何一个子组件有一个非零的 [FlexParentData.flex] 和一个 [FlexFit.tight] the [RenderFlex] will assert。因为这样可用空间将会是无限的，但是不能给一个无限的大小。

#### max
最大化主轴上的可用空间，具体取决于传入的布局约束。

如果传入的布局约束具有足够小的 [BoxConstraints.maxWidth] 或 [BoxConstraints.maxHeight]，可能仍然没有可用空间。

如果传入的布局约束是无限制的，the [RenderFlex] will assert。因为这样可用空间将会是无限的，但是不能给一个无限的大小。

### 4.4 Axis
二维基本方向。轴始终相对于当前坐标空间，例如，由于某些局部转换应用场景，一个水平轴可能是从右上到左下的斜对角。

#### horizontal & vertical
横轴、纵轴。

### 4.5 AxisDirection
沿着横轴或纵轴上的方向。

#### up
零值在底部，正值在其上方：⇈

#### right
零值在左边，正值在其右边：⇉

#### down
零值在顶部，正值在其下方：⇊

#### left
零值在右边，正值在其左边：⇇

### 4.5 TextDirection
文字展示的方向。TODO
