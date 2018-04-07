//
//  EndCalenderViewController.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 5..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit
import FSCalendar

class EndCalenderViewController: UIViewController {
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd-EEEE"
        return formatter
    }()
    

    let dismissButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: UIControlState.normal)
        button.addTarget(self, action: #selector(closeView), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: UIControlState.normal)
        button.addTarget(self, action: #selector(closeEndCalenderView), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "도착 날짜 선택"
        return label
    }()
    
    let calender: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        setupViews()
    }


}



extension EndCalenderViewController {
    func setupViews() {
        self.view.addSubview(dismissButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(doneButton)
        self.view.addSubview(calender)
        
        dismissButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 10).isActive = true
        if #available(iOS 11.0, *) {
            dismissButton.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        }
        else {
            dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16).isActive = true
        }
        
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor, constant: 0).isActive = true
        
        doneButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10).isActive = true
        doneButton.centerYAnchor.constraint(equalTo: dismissButton.centerYAnchor, constant: 0).isActive = true
        
        calender.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 16).isActive = true
        calender.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        calender.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        calender.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
    }
    
    @objc func closeView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func closeEndCalenderView() {
        if let selected = calender.selectedDate {
            let formattedSelected = self.dateFormatter.string(from: selected)
            print("selected date is \(formattedSelected)")
            
//
//            if let arriveDate = SharedCalendar.shared.arriveDate {
//                if arriveDate > selected {
//                    let alert = UIAlertController(title: "날짜 선택 오류", message: "도착날짜가 더 빠를수 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
//                    alert.addAction(UIAlertAction(title: "돌아가기", style: UIAlertActionStyle.default, handler: { (alert) in
//                        self.dismiss(animated: true, completion: nil)
//                    }))
//                    SharedCalendar.shared.arriveDate = nil
//                    self.present(alert, animated: true, completion: nil)
//                    return
//                }
//            } else {
//                SharedCalendar.shared.arriveDate = selected
//
//                NotificationCenter.default.post(name: NSNotification.Name.SelectDateDone, object: nil)
//            }
//
            
            if let departDate = SharedCalendar.shared.departDate {
                if departDate > selected {
                    let alert = UIAlertController(title: "날짜 선택 오류", message: "도착날짜가 더 빠를수 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "돌아가기", style: UIAlertActionStyle.default, handler: { (alert) in
                        SharedCalendar.shared.initialize()
                        self.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                else {
                    SharedCalendar.shared.arriveDate = selected
//                    SharedCalendar.shared.arriveDate = Calendar.current.date(byAdding: .day, value: 1, to: selected)
                    
                    NotificationCenter.default.post(name: NSNotification.Name.SelectDateDone, object: nil)
                }
            }

        } else {
            let alert = UIAlertController(title: "날짜 선택 오류", message: "도착 날짜를 지정해주세요.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "돌아가기", style: UIAlertActionStyle.default, handler: { (alert) in
                SharedCalendar.shared.initialize()
                self.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        dismiss(animated: true, completion: nil)
    }
}
