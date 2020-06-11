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
* margin: 装饰和子组件之间的间距？
* transform: 矩阵变换
* child: 子组件

## 4 使用方式
```dart
Padding(
    padding: EdgeInsets.all(8.0),
    child: const Card(child: Text('Hello World!')),
)
```