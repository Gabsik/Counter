//
//  ViewController.swift
//  Counter
//
//  Created by User on 06.12.2024.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    private var numberOfClicks = 0
    private var clickHistory: [String] = []
    private let date = Date()
    private let dateFormatter = DateFormatter()
    @IBOutlet weak var counterHistoryTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        counterHistoryTextView.text = "История изменений \n"
    }
    @IBAction func resetСounterButton(_ sender: Any) {
        resetCounter()
        counterHistory(action: formattedDate() + ":вы сбросили счетчик")
    }
    
    @IBAction func plusValueButton(_ sender: Any) {
        addingCounter()
    }
    @IBAction func minusValueButton(_ sender: Any) {
        decreaseCounter()
    }
    private func addingCounter() {
        numberOfClicks = numberOfClicks + 1
        numberLabel.text = "\(numberOfClicks)"
        counterHistory(action: formattedDate() +  ":значение изменено на +1")
    }
    private func decreaseCounter() {
        if numberOfClicks > 0 {
            numberOfClicks = numberOfClicks - 1
            numberLabel.text = "\(numberOfClicks)"
            counterHistory(action: formattedDate() + ":значение изменено на -1")
        }else {
            numberLabel.text = "\(0)"
            counterHistory(action: formattedDate() + ":попытка уменьшить значение счётчика ниже 0")
        }
    }
    private func resetCounter() {
        numberOfClicks = 0
        numberLabel.text = "\(numberOfClicks)"
    }
    private func counterHistory(action: String) {
        clickHistory.append(action)
        counterHistoryTextView.text = "\(clickHistory.joined(separator: "\n"))"
    }
    private func formattedDate() -> String {
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
