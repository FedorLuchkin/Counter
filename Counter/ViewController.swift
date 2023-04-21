//
//  ViewController.swift
//  Counter
//
//  Created by Fixed on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {
    private var counter: Int = 0
    private let dateFormatter = DateFormatter()
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        counter += 1
        counterLabel.text = String(counter)
        historyTextView.insertText("\(dateFormatter.string(from: Date())): значение изменено на +1\n")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = String(counter)
            historyTextView.insertText("\(dateFormatter.string(from: Date())): значение изменено на -1\n")
        } else {
            historyTextView.insertText("\(dateFormatter.string(from: Date())): попытка уменьшить значение счётчика ниже 0\n")
        }
    }
    
    @IBAction func resetButtonDidTap(_ sender: Any) {
        counter = 0
        counterLabel.text = String(counter)
        historyTextView.insertText("\(dateFormatter.string(from: Date())): значение сброшено\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd MMM YYYY HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US")
        
        historyTextView.layer.cornerRadius = 35
        historyTextView.insertText("\nИстория изменений:\n")
        historyTextView.layer.borderWidth = 2

        counterLabel.layer.cornerRadius = 35
        counterLabel.layer.borderWidth = 3
        counterLabel.layer.masksToBounds = true
        
        counterLabel.text = String(counter)
        
        plusButton.tintColor = UIColor.systemRed
        plusButton.layer.cornerRadius = 35
        plusButton.layer.borderWidth = 1
        plusButton.layer.masksToBounds = true
        
        minusButton.tintColor = UIColor.systemBlue
        minusButton.layer.cornerRadius = 35
        minusButton.layer.borderWidth = 1
        minusButton.layer.masksToBounds = true
        
        resetButton.tintColor = UIColor.systemGray
        resetButton.layer.cornerRadius = 35
        resetButton.layer.borderWidth = 1
        resetButton.layer.masksToBounds = true
    }
}
