//
//  AddViewController.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 5..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd-EEEE"
        return formatter
    }()
    
    let planCollectionViewCellId = "cellId"
    
    
    lazy var planCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.register(PlanCollectionViewCell.self, forCellWithReuseIdentifier: planCollectionViewCellId)
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Plan"
        self.view.backgroundColor = UIColor.white
        
        setupViews()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "날짜 선택", style: UIBarButtonItemStyle.plain, target: self, action: #selector(presentCalendarView))
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.MoveToNextCalender, object: nil, queue: OperationQueue.main) { (noti) in
            let endView = EndCalenderViewController()
            self.present(endView, animated: true, completion: nil)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.SelectDateDone, object: nil, queue: OperationQueue.main) { (noti) in
//            Make Collection view on Add View Controller... by selected date
            let calendar = Calendar.current
            guard let departDate = SharedCalendar.shared.departDate else {
                return
            }
            guard let arriveDate = SharedCalendar.shared.arriveDate else {
                return
            }
            
            SharedCalendar.shared.selectedDateArray = self.generateSelectedDateArray(departDate: departDate, arriveDate: arriveDate)
            
            
            let components = calendar.dateComponents([.day], from: departDate, to: arriveDate)
            guard let numberOfDays = components.day else {
                return
            }
            SharedCalendar.shared.numberOfDays = numberOfDays + 1
            
            self.planCollectionView.reloadData()
            
//            print("numberOfDays: \(SharedCalendar.shared.numberOfDays)")
//            print("departDate: \(departDate)")
//            print("arriveDate: \(arriveDate)")
            print("array: \(SharedCalendar.shared.selectedDateArray)")

        }
    }
    
    


}


extension AddViewController {
    @objc func presentCalendarView() {
        SharedCalendar.shared.arriveDate = nil
        SharedCalendar.shared.departDate = nil
        SharedCalendar.shared.numberOfDays = nil
        SharedCalendar.shared.selectedDateArray = []
        let calendarView = CalendarViewController()
        self.navigationController?.present(calendarView, animated: true, completion: nil)
    }
    
    func generateSelectedDateArray(departDate: Date, arriveDate: Date) -> [Date] {
        var dateArray: [Date] = [Date]()
        var departDate = departDate
        var arriveDate = arriveDate
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        while departDate <= arriveDate {
            dateArray.append(departDate)
            departDate = Calendar.current.date(byAdding: .day, value: 1, to: departDate)!
        }
        return dateArray
    }
    
    func setupViews() {
        let margins = view.layoutMargins
        view.addSubview(planCollectionView)
        planCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: margins.left).isActive = true
        planCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: margins.top).isActive = true
        planCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margins.right).isActive = true
        planCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -margins.bottom).isActive = true
    }
 
}

extension AddViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let numberOfDays = SharedCalendar.shared.numberOfDays {
            return numberOfDays
        }
        return 0

        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: planCollectionViewCellId, for: indexPath) as! PlanCollectionViewCell
        if let dateArray = SharedCalendar.shared.selectedDateArray {
            print(dateArray)
            let strDate = dateFormatter.string(from: dateArray[indexPath.row])
            cell.dateLabel.text = strDate
        }
        
        return cell
    }
    
    
}

extension AddViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 480)
    }
}














