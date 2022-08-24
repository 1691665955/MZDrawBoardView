//
//  ViewController.swift
//  MZDrawBoardView
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawBoardView: MZDrawBoardView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
          
    }

    @IBAction func clearDrawBoard(_ sender: Any) {
        self.drawBoardView.clear()
    }
    
    @IBAction func back(_ sender: Any) {
        self.drawBoardView.back()
    }
    
    @IBAction func saveImage(_ sender: Any) {
        self.imageView.image = self.drawBoardView.getImage()
    }
    
    @IBAction func selectColor(_ sender: UITapGestureRecognizer) {
        self.drawBoardView.lineColor = sender.view?.backgroundColor ?? .black
        self.drawBoardView.lineWidth = CGFloat(sender.view?.tag ?? 4)
    }
    
}

