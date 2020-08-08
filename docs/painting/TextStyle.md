# TextStyle 类
## 1. 功能介绍
> An immutable style in which paint text.

绘制文字时不可修改的样式。

### Bold
这里一个单行文本的文本组件中，给定一个特定的覆盖样式，该样式通过环境的 [DefaultTextStyle] 进行混合使用。
![粗体文本样例](https://flutter.github.io/assets-for-api-docs/assets/painting/text_style_bold.png)
```dart
Text(
  'No, we need bold strokes. We need this plan.',
  style: TextStyle(fontWeight: FontWeight.bold),
)
```

### Italics
使用斜体
![斜体文本样例](https://flutter.github.io/assets-for-api-docs/assets/painting/text_style_italics.png)
```dart
Text(
  'Welcome to the present, we\'re running a real nation.',
  style: TextStyle(fontStyle: FontStyle.italic)
)
```

### Opacity and Color
示例中每一行越来越不透明。基本颜色是 [material.Colors.black] 和 [Color.withOpacity] 来创建一个派生的期望颜色。

如果 [color] 被指定，[foreground] 必须为空，反之亦然。[color] 被当做 Paint()..color = color 的速记。
如果 [backgroundColor] 被指定，[background] 必须为空，反之亦然。
![文本的不透明度和颜色](https://flutter.github.io/assets-for-api-docs/assets/painting/text_style_opacity_and_color.png)

## 2. 继承关系
```dart
Text -> StatelessWidget -> Widget
```

## 3. 关键成员
### 3.1 构造函数

### 3.2 成员变量

## 4. 相关类
