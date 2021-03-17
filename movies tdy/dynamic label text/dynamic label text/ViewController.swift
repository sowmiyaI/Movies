//
//  ViewController.swift
//  dynamic label text
//
//  Created by apple on 08/12/1942 Saka.
//

import UIKit

class ViewController: UIViewController {
    var text1 = UITextField()
    var label1 = UILabel()
    var button1 = UIButton()

    override func viewDidLoad() {
        text1.text = "hi"
        text1.frame = CGRect(x: 100, y: 200, width: 40, height: 50)
        text1.textColor = .blue
        text1.backgroundColor = .red
        self.view.addSubview(text1)
        
        
        label1.text = "hi"
        label1.frame = CGRect(x: 200, y: 100, width: 40, height: 500)
        label1.textColor = .gray
        label1.backgroundColor = .green
        self.view.addSubview(label1)
        
        
        button1.frame = CGRect(x: 150, y: 300, width: 140, height: 150)
        button1.backgroundColor = .red
        button1.setTitle("hello", for: .normal)
        button1.setTitle("hello", for: .highlighted)
        button1.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(button1)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func click()
    {}


}

