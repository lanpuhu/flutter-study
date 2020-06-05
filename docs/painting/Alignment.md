# Alignment 组件
## 1. 功能简介
> A widget that aligns its child within itself and optionally sizes itself based on the child's size.

对齐组件，设置子组件的对齐方式，并根据子组件的大小调整自身尺寸。

## 2. 继承关系
```
Align -> SingleChildRenderObjectWidget -> RenderObjectWidget
```

## 3. 源码解析
### 3.1 构造函数
```
const Align({
    Key key,
    this.alignment = Alignment.center,
    this.widthFactor,
    this.heightFactor,
    Widget child,
  })
```
* key: 组件的标识
* alignment: 对齐方式，参考 Alignment // TODO
* widthFactor: 组件的宽度 = 子组件的宽度 * widthFactor
* heightFactor: 组件的高度 = 子组件的高度 * heightFactor
* child: 子组件

## 4 使用方式
```
Container(
  width: 120,
  height: 120,
  color: Colors.blue[50],
  child: Align(
    alignment: Alignment.bottomRight,
    child: FlutterLogo(
      size: 60,
    ),
  ),
),
```