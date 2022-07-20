//
//  FirstViewController.swift
//  HelloDuna5th
//
//  Created by Seungyun Kim on 2022/07/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    static let identifier = "FirstViewController"

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondViewController.identifier) as? SecondViewController else { return }
        
////        present/push 방법
//        nextVC.receivedText = textField.text ?? ""
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("test"), object: nil)
        
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            textField.text = text
        }
    }

}
