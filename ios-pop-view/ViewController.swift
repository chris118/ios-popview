//
//  ViewController.swift
//  demo
//
//  Created by admin on 2018/8/2.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addSubview(nextButton)
        maskView.addSubview(contentView)
    }

    @IBAction func tap(_ sender: Any) {
      showPopup()
    }
    
    private func showPopup() {
        maskView.show()
    
        contentView.frame.origin.y = 2000
        UIView.animate(withDuration: 0.3) {
            self.contentView.frame.origin.y = UIScreen.main.bounds.height - 400
        }
    }
    
    private func hidePopup() {
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.frame.origin.y = 2000
        }) { (complete) in
            self.maskView.hide()
        }
    }
    
    @objc private func tapAction(action:UITapGestureRecognizer) -> Void {
        hidePopup()
    }
    
    @objc private func nextAction() -> Void {
        print("tap")
    }
    
    private lazy var maskView: EBMaskView = {
        var mask = EBMaskView()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(action:)))
        mask.addGestureRecognizer(tapGesture)
        return mask
    }()
    
    private lazy var contentView: UIView = {
        var view = UIView(frame: self.view.bounds)
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 400, width: UIScreen.main.bounds.width, height: 400)
        view.backgroundColor = UIColor.white
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var nextButton: UIButton = {
        var btn = UIButton(type:.system)
        btn.frame = CGRect(x: 16, y: 300, width: UIScreen.main.bounds.width - 32, height: 44)
        btn.backgroundColor = UIColor.gray
        btn.setTitleColor(UIColor.white,for: .normal)
        btn.setTitle("next", for: .normal)
        btn.isUserInteractionEnabled = true
        btn.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        return btn
    }()
    
}

