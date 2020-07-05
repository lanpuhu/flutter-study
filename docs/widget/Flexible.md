# Flexible 组件
## 1. 功能介绍
> A widget that controls how a child of a [Row], [Column], or [Flex] flexes.

控制类型为 [Row]、[Column]、[Flex] 的子组件如何进行弹性布局。

使用 Flexible 组件可以让 [Row]、[Column]、[Flex] 子组件灵活地在主轴上填充可用空间。
不像 [Expanded] 组件，[Flexible] 组件不要求子组件填充所有的可用空间。

## 2. 继承关系
```dart
Flexible -> ParentDataWidget<Flex> -> ProxyWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
const Flexible({
  Key key,
  this.flex = 1,
  this.fit = FlexFit.loose,
  @required Widget child,
}) : super(key: key, child: child);
```

### 3.2 关键成员
#### int flex
用于子组件的弹性因子。如果为 null 或零，则子组件是不弹性的并且由它自己的大小决定。如果为非零，则子组件在主轴上能够占用的空间大小由剩余空间（已经分配了非弹性的子组件）根据弹性因子进行分割。

#### FlexFit fit
描述一个弹性子组件如何占有剩余空间。如果 flex 是非零的，fit 决定子组件是否填充父组件的所有可用空间。如果 fit 是 [FlexFit.tight]，子组件会填充所有可用空间。如果 fit 是 [FlexFit.loose]，子组件最大填充父组件的所有可用空间，但是可以更小。

## 4. 相关类
