# Text 组件
## 1. 功能介绍
> A run of text with a single style.

具有单一样式的一系列文本。

文本组件使用单一样式来显示一串文本。根据布局约束，字符串可能会被折行，也可能全部显示在同一行。

[style] 参数是可选的，如果省略，文本将使用最近的封闭 [DefaultTextStyle] 中的样式。如果给定的样式 [TextStyle.inherit] 属性是 true (默认值)，则给定的样式将与最近的封闭 [DefaultTextStyle] 合并。这种合并行为非常有用，例如，在使用默认字体和大小时，使文本加粗。

以下例如展示如何使用 [Text] 组件，如果文本溢出，将会使用省略号进行截断。
![Text组件的使用](https://flutter.github.io/assets-for-api-docs/assets/widgets/text.png)
![省略号截断](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_ellipsis.png)

## 2. 继承关系
```dart
Image -> StatefulWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
```
### 3.2 成员变量

## 4. 相关类
