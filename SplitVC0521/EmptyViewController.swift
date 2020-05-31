//
//  EmptyVC.swift
//  SplitVC0521
//
//  Created by leslie on 5/24/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = splitViewController?.displayModeButtonItem
        navigationItem.leftBarButtonItem = button
        navigationItem.leftItemsSupplementBackButton = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
