//
//  MainViewController.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 5..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if SharedAuth.shared.isAuthenticated == false {
            let destVC = LoginViewController()
            self.present(destVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(presentAddView))

    }
    
    
    
    
}

extension MainViewController {
    @objc func presentAddView() {
        let addViewController = AddViewController()
        self.navigationController?.pushViewController(addViewController, animated: true)
//        self.navigationController?.present(addViewController, animated: true, completion: nil)
    }
}
