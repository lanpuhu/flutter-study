# Padding 组件
## 1. 功能简介
> A widget that insets its child by the given padding.

设置组件与其子组件的内边距。

## 2. 继承关系
```
Padding -> SingleChildRenderObjectWidget -> RenderObjectWidget
```

## 3. 源码解析
### 3.1 构造函数
```
const Padding({
    Key key,
    @required this.padding,
    Widget child,
  })
```
* key: 组件的标识
* padding: 内边距大小，参考 [EdgeInsets](../painting/Alignment.md)
* child: 子组件

## 4 使用方式
```dart
Padding(
    padding: EdgeInsets.all(8.0),
    child: const Card(child: Text('Hello World!')),
)
```