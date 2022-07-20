//
//  SecondViewController.swift
//  HelloDuna5th
//
//  Created by Seungyun Kim on 2022/07/20.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let identifier = "SecondViewController"

    @IBOutlet weak var textField: UITextField!
    var receivedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = receivedText
    }
    
    // remove 하지 않으면 notification 이 헤엄치고 다님 -> 메모리 사용
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    

    @IBAction func touchUpToSendData(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("test"), object: textField.text ?? "")
        
//        //present/push
//        let presentingVC = presentingViewController as? FirstViewController
//        presentingVC?.textField.text = textField.text
        dismiss(animated: true, completion: nil)
    }
    
    func setData(data: String) {
        textField.text = data
    }
}
