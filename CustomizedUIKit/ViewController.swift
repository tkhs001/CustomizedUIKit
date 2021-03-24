//
//  ViewController.swift
//  CustomizedUIKit
//
//  Created by Naoyuki TAKAHASHI on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var progressViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func progressViewTouchUpInside(_ sender: UIButton) {
        let vc = CustomizedProgressViewSampleViewController.instantiate()
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true, completion: nil)
    }

}

