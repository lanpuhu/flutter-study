# Expanded 组件
## 1. 功能介绍
> A widget that expands a child of a [Row], [Column], or [Flex] so that the child fills the available space.

扩展类型为 [Row]、[Column]、[Flex] 的子组件填满可用空间。

使用 Expanded 组件可以让 [Row]、[Column]、[Flex] 子组件在主轴上填满可用空间。
如果有多个子组件需要被扩展，可用空间会根据弹性因子进行分割。

一个 [Expanded] 组件必须是 [Row]、[Column]、[Flex] 的子类，并且从 [Expanded] 组件到 [Row] 、[Column]、[Flex] 的封闭路径中只能包含 [StatelessWidget] 和 [StatefulWidget]，不能是其它的类型的组件，例如 [RenderObjectWidget]。

## 2. 继承关系
```dart
Expanded -> Flexible -> ParentDataWidget<Flex> -> ProxyWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
const Expanded({
  Key key,
  int flex = 1,
  @required Widget child,
}) : super(key: key, flex: flex, fit: FlexFit.tight, child: child);
```
## 4. 相关类
