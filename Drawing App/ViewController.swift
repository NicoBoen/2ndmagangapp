//
//  ViewController.swift
//  Drawing App
//
//  Created by Nico Boentoro on 7/18/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var paintView = PaintView()
    
    override func loadView() {
        paintView.backgroundColor = UIColor.white
        view = paintView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

