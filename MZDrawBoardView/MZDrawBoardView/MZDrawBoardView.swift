//
//  MZDrawBoardView.swift
//  MZDrawBoardView
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

class MZDrawBoardView: UIView {

    /// 画笔颜色
    var lineColor: UIColor = .black
    
    /// 画笔线条宽度
    var lineWidth: CGFloat = 4
    
    private var startPoint: CGPoint?
    private var endPoint: CGPoint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    /// 清空画板
    open func clear() {
        if let subLayers = self.layer.sublayers {
            for subLayer in subLayers {
                subLayer.removeFromSuperlayer()
            }
        }
    }
    
    /// 画板生成图片
    open func getImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func setup() {
        self.clipsToBounds = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction(_:)))
        self.addGestureRecognizer(pan)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func panAction(_ pan: UIPanGestureRecognizer) {
        switch pan.state {
        case .began:
            self.startPoint = pan.location(in: self)
            self.endPoint = pan.location(in: self)
            self.updateLayer()
        case .changed, .ended:
            self.startPoint = self.endPoint
            self.endPoint = pan.location(in: self)
            self.updateLayer()
        default:
            break
        }
    }
    
    @objc private func tapAction(_ tap: UITapGestureRecognizer) {
        self.startPoint = tap.location(in: self)
        self.endPoint = tap.location(in: self)
        self.updateLayer()
    }
    
    private func updateLayer() {
        let path = UIBezierPath()
        path.move(to: self.startPoint!)
        path.addLine(to: self.endPoint!)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = self.lineWidth
        shapeLayer.strokeColor = self.lineColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = path.cgPath
        shapeLayer.lineJoin = .round
        shapeLayer.lineCap = .round
        self.layer.addSublayer(shapeLayer)
    }
}
