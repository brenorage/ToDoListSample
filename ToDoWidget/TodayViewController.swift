//
//  TodayViewController.swift
//  ToDoWidget
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var labels: [UILabel]!
    
    private lazy var userDefaultService = UserDefaultWrapper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        switch activeDisplayMode {
        case .compact:
            preferredContentSize = maxSize
            setfirstText()
        default:
            preferredContentSize = CGSize(width: maxSize.width, height: 220)
            setLastTexts()
        }
    }
    
    private func setFirstLabel(with text: String) {
        labels[0].text = text
        labels[0].isHidden = false
        labels[1].isHidden = true
        labels[2].isHidden = true
    }
    
    private func setLabels(with texts: [String]) {
        for (index, label) in labels.enumerated() {
            let indexContains = texts.indices.contains(index)
            if indexContains {
                label.text = texts[index]
                label.isHidden = false
            } else {
                label.isHidden = true
            }
        }
    }
    
    private func setfirstText() {
        let result: ResultType<[String]> = userDefaultService.get(with: userDefaultService.toDoListKey)
        switch result {
        case let .success(list):
            guard let firstText = list.first else { return }
            setFirstLabel(with: firstText)
        case .failure:
            setFirstLabel(with: "Não existem ToDos na sua lista")
        }
    }
    
    private func setLastTexts() {
        let result: ResultType<[String]> = userDefaultService.get(with: userDefaultService.toDoListKey)
        switch result {
        case let .success(list):
            let firstElements = list.prefix(3)
            setLabels(with: Array(firstElements))
        case .failure:
            setFirstLabel(with: "Não existem ToDos na sua lista")
        }
    }
}
