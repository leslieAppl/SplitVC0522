//
//  DetailViewController.swift
//  SplitVC0521
//
//  Created by leslie on 5/21/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var bookCover: UIImageView!
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    var selected: Int!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    func configureView2() {
        if selected == nil && !AppData.items2.isEmpty {
            selected = 0
        }
        if selected != nil {        
            let data = AppData.items2[selected]
            bookCover.image = UIImage(named: data)
            bookTitle.text = AppData.itemsData[data]?[0]
            bookAuthor.text = AppData.itemsData[data]?[1]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        configureView2()
        
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

