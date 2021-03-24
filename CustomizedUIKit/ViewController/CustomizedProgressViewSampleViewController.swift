//
//  CustomizedProgressViewSampleViewController.swift
//  CustomizedUIKit
//
//  Created by Naoyuki TAKAHASHI on 2021/03/24.
//

import UIKit

class CustomizedProgressViewSampleViewController: UIViewController {

    @IBOutlet private var progressView: CustomizedProgressView!
    @IBOutlet private var slider: UISlider!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Customized Progress View Sample"
        slider.value = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        progressView.updateProgress(percentage: sender.value)
    }

}

extension CustomizedProgressViewSampleViewController {
    class func instantiate() -> CustomizedProgressViewSampleViewController {
        UIStoryboard(name: String(describing: Self.classForCoder()), bundle: Bundle(for: Self.self))
            .instantiateInitialViewController() as! CustomizedProgressViewSampleViewController
    }
}
