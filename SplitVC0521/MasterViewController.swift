//
//  MasterViewController.swift
//  SplitVC0521
//
//  Created by leslie on 5/21/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        AppData.items2.append(NSDate().description)
//bug        let indexPath = IndexPath(row: AppData.items2.count - 1, section: 0)
//bug        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                
                if indexPath.row < AppData.items2.count {
                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controller.navigationItem.leftItemsSupplementBackButton = true
                    detailViewController = controller
                    controller.selected = indexPath.row
                }
                else {
                    let object = objects[indexPath.row] as! NSDate
                    controller.detailItem = object
                    controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                    controller.navigationItem.leftItemsSupplementBackButton = true
                    detailViewController = controller
                }
                
                
            }
        }
    }

    // MARK: - Table View Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.items2.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row < AppData.items2.count {
            let item = AppData.items2[indexPath.row]
            cell.textLabel?.text = AppData.itemsData[item]?[0]
            return cell
        }
        else {
            let object = objects[indexPath.row] as! NSDate
            cell.textLabel!.text = object.description
            return cell
        }
    }

    //MARK: - Table View Handle Edit Mode
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            if indexPath.row < AppData.items2.count {
                AppData.items2.remove(at: indexPath.row)
//bug                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            else {
                objects.remove(at: indexPath.row)
//bug                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
            insertNewObject(self)
        }
        
        tableView.reloadData()
    }
        
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row == 0 {
            return .insert
        }
        else {
            return .delete
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select row at: \(indexPath.row)")
    }
}

