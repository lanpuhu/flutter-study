# EdgeInsets 属性
## 1. 功能简介
> An immutable set of offsets in each of the four cardinal directions.

四个基本方向上的一组不可变的偏移量。

## 2. 继承关系
```dart
EdgeInsets -> EdgeInsetsGeometry
```

## 3. 基本规则
具有上下左右四个方向的值，初始化 EdgeInsets 即是给这四个方向赋值。

## 4. 源码解析
### 4.1 构造函数
```dart
const EdgeInsets.fromLTRB(this.left, this.top, this.right, this.bottom);
```
命名构造函数，直接对上下左右这几个偏移量进行赋值，参数是位置参数。

```dart
const EdgeInsets.all(double value)
  : left = value,
    top = value,
    right = value,
    bottom = value;
```
命名构造函数，上下左右四个偏移量相等。

```dart
const EdgeInsets.only({
  this.left = 0.0,
  this.top = 0.0,
  this.right = 0.0,
  this.bottom = 0.0
});
```
命名构造函数，根据需要对某个方向上的偏移量进行赋值，参数是可选命名参数，默认值是 0.0。

```dart
const EdgeInsets.symmetric({
  double vertical = 0.0,
  double horizontal = 0.0
}): left = horizontal,
    top = vertical,
    right = horizontal,
    bottom = vertical;
```
命名构造函数，创建对称的偏移量，即左右、上下具有相同的值，参数是可选命名参数，默认值是 0.0。

## 5 使用方式
### 5.1 创建对象
```dart
EdgeInsets.fromLTRB(10, 20, 30, 40);
EdgeInsets.all(10);
EdgeInsets.only(left: 40);
EdgeInsets.symmetric(horizontal: 20);
```

### 5.2 常用快捷方式
