# MZDrawBoardView
画板组件、实现简单绘画、清空、生成图片功能

<div align=center>
<img src="1.gif" width="300px" />
</div>

#### Cocoapods 引入
```
pod 'MZCircleProgress', '~> 0.0.1'
```

#### 使用
```
let drawBorad = MZDrawBoardView(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 200))
drawBorad.backgroundColor = .gray
// 设置画板画笔颜色
drawBorad.lineColor = .black
// 设置画板画笔粗细
drawBorad.lineWidth = 4
self.view.addSubview(drawBorad)

// 清空画板内容
drawBorad.clear()

// 画板内容生成图片
let image = drawBorad.getImage()
```
