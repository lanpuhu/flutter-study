# Stack 组件
## 1. 功能介绍
> A widget that positions its children relative to the edges of its box.

将子组件相对于其边框进行定位布局的组件。

如果你想以简单的方式重叠多个子组件，这个组件就非常有用了。例如有一些文本和图像，在其底部覆盖一个渐变和一个按钮。

Stack 组件的子组件，要么是 _positioned_ 或者 _non-positioned_。定位的子组件是那些被 [Positioned] 组件包裹的组件，其至少具有一个非空属性。Stack 组件设置其大小以包含所有非定位子组件，那些子组件根据 alignment 来定位（在从左到右的环境中默认左上角，在从右到左的环境中默认右上角）。定位的组件根据其上下左右的属性来相对布局。

Stack 组件渲染子组件的顺序是第一个子组件被渲染在底部。如果你想修改子组件的渲染顺序，可以重新构建子组件的顺序。如果你想对子组件重新排序，考虑给子组件一个非空键值。这些键值会让框架移动这些子组件到它新的位置，而不是在它们新的位置上重新创建它们。

## 2. 继承关系
```dart
Stack -> MultiChildRenderObjectWidget -> RenderObjectWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
Stack({
  Key key,
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.overflow = Overflow.clip,
  List<Widget> children = const <Widget>[],
}) : super(key: key, children: children);
```
### 3.2 成员变量
#### AlignmentGeometry alignment
非定位的子组件的对齐方式。

#### Overflow overflow
超出边界的子组件是否被裁剪

## 4. 相关类
