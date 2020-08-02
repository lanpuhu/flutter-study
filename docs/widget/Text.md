# Text 组件
## 1. 功能介绍
> A run of text with a single style.

具有单一样式的一系列文本。

文本组件使用单一样式来显示一串文本。根据布局约束，字符串可能会被折行，也可能全部显示在同一行。

[style] 参数是可选的，如果省略，文本将使用最近的封闭 [DefaultTextStyle] 中的样式。如果给定的样式 [TextStyle.inherit] 属性是 true (默认值)，则给定的样式将与最近的封闭 [DefaultTextStyle] 合并。这种合并行为非常有用，例如，在使用默认字体和大小时，使文本加粗。

以下例如展示如何使用 [Text] 组件，如果文本溢出，将会使用省略号进行截断。
![Text组件的使用](https://flutter.github.io/assets-for-api-docs/assets/widgets/text.png)
![省略号截断](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_ellipsis.png)

```dart
Text(
  'Hello, $_name! How are you?',
  textAlign: TextAlign.center,
  overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold),
);
```

使用 [Text.rich] 构造器，[Text] 组件可以显示不同样式的 [TextSpan] 的段落。以下示例显示 “Hello beautiful world”，每个单词显示不同的样式。
![A screenshot of the following rich text example](https://flutter.github.io/assets-for-api-docs/assets/widgets/text_rich.png)

```dart
const Text.rich(
  TextSpan(
    text: 'Hello', // 默认文本样式
    children: <TextSpan> [
      TextSpan(text: 'beautiful', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
);
```

如果想让 [Text] 组件对触摸事件有反应，使用 [GestureDetector] 组件将其包装，并实现 [GestureDetector.onTap]。

在材质设计的应用中，考虑使用 [FlatButton] 替代，或者它不适用，至少使用 [InkWell] 替代 [GestureDetector]。

若使部分文本可交互，使用 [RichText]，为部分相关文字 [TextSpan.recognizer] 指定 [TapGestureRecoginzer]。

## 2. 继承关系
```dart
Text -> StatelessWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数
```dart
// 创建一个文本组件
// 如果 [style] 参数为空，则组件使用最近闭包的 [DefaultTextStyle]
// [data] 参数不能为空
const Text(
  this.data, {
  Key key,
  this.style,
  this.strutStyle,
  this.textAlign,
  this.textDirection,
  this.locale,
  this.softWrap,
  this.overflow,
  this.textScaleFactor,
  this.maxLines,
  this.semanticsLabel,
  this.textWidthBasis,
}) : assert(data != null)
     textSpan = null,
     super(key: key);
```
### 3.2 成员变量

## 4. 相关类
