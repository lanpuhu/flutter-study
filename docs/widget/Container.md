# Container 组件
## 1. 功能简介
> A convenience widget that combines common painting, positioning, and sizing widgets.

容器组件组合了绘制、位置和大小。

## 2. 继承关系
```
Container -> StatelessWidget
```

## 3. 源码解析
### 3.1 构造函数
```dart
Container({
    Key key,
    this.alignment,
    this.padding,
    Color color,
    Decoration decoration,
    this.foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    this.margin,
    this.transform,
    this.child,
  }) : assert(margin == null || margin.isNonNegative),
       assert(padding == null || padding.isNonNegative),
       assert(decoration == null || decoration.debugAssertIsValid()),
       assert(constraints == null || constraints.debugAssertIsValid()),
       assert(color == null || decoration == null,
         'Cannot provide both a color and a decoration\n'
         'The color argument is just a shorthand for "decoration: new BoxDecoration(color: color)".'
       ),
       decoration = decoration ?? (color != null ? BoxDecoration(color: color) : null),
       constraints =
        (width != null || height != null)
          ? constraints?.tighten(width: width, height: height)
            ?? BoxConstraints.tightFor(width: width, height: height)
          : constraints,
       super(key: key);
```
* key: 组件的标识
* alignment: 子组件的对齐方式，参考 [Alignment](../painting/Alignment.md)
* padding: 子组件的内边距大小，参考 [EdgeInsets](../painting/EdgeInsets.md)
* decoration: (装饰者，暂时理解为组件背景)
* color: 若 decoration 为空并且 color 不空，则会创建一个 BoxDecoration(color) 并赋值给 decoration
* foregroundDecoration: 前景
* width: 组件宽度
* height: 组件宽度
* constraints: 尺寸约束，若 width 和 height 不为空，则使用 width 和 height 来创建约束
* margin: 装饰和子组件外部的区域
* transform: 矩阵变换
* child: 子组件

### 3.2 build 函数
```dart
Widget build(BuildContext context) {
  Widget current = child;

  if (child == null && (constraints == null || !constraints.isTight)) {
    current = LimitedBox(
      maxWidth: 0.0,
      maxHeight: 0.0,
      child: ConstrainedBox(constraints: const BoxConstraints.expand()),
    );
  }

  if (alignment != null)
    current = Align(alignment: alignment, child: current);

  final EdgeInsetsGeometry effectivePadding = _paddingIncludingDecoration;
  if (effectivePadding != null)
    current = Padding(padding: effectivePadding, child: current);

  if (decoration != null)
    current = DecoratedBox(decoration: decoration, child: current);

  if (foregroundDecoration != null) {
    current = DecoratedBox(
      decoration: foregroundDecoration,
      position: DecorationPosition.foreground,
      child: current,
    );
  }

  if (constraints != null)
    current = ConstrainedBox(constraints: constraints, child: current);

  if (margin != null)
    current = Padding(padding: margin, child: current);

  if (transform != null)
    current = Transform(transform: transform, child: current);

  return current;
}
```
通过一层层的组件包裹，将所有的属性组合在一起。

## 4 使用方式
```dart
Container(
  constraints: BoxConstraints.expand(
    height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
  ),
  padding: const EdgeInsets.all(8.0),
  color: Colors.blue[600],
  alignment: Alignment.center,
  child: Text(
    'Hello World',
    style: Theme.of(context)
      .textTheme
      .display1
      .copyWith(color: Colors.white),
  ),
  transform: Matrix4.rotationZ(0.1),
)
```

