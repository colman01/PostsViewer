//
//  BaseViewController.swift
//  PostViewer
//
//  Created by Colman Marcus-Quinn on 18.12.19.
//  Copyright © 2019 none. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 10/255, green: 139/255, blue: 211/255, alpha: 1.0)
    }
    
    func displayAlert(_ title: String, _ body: String) {
        DispatchQueue.main.async {
            self.alert.dismiss(animated: true) {
                self.navigationController!.dismiss(animated: false, completion: nil)
                let alertController = UIAlertController(title: "\(title)", message: "\(body)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                    
                }))
                self.navigationController?.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}
