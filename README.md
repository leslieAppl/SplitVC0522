# SplitViewController

## Split View Controller

## Adding and removing rows with EditingStyle.insert
        
        import UIKit

        class MasterViewController: UITableViewController {

            var objects = [Any]()
            
            // MARK: - Table View Data Source
            override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                
                tableView.isEditing = true
                if editingStyle == .delete {
                    objects.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                else if editingStyle == .insert {
                    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
                    objects.append(NSDate())
                    let indexPath = IndexPath(row: objects.count - 1, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                }
                
                
            }
            
            //MARK: - Table View Delegate
            override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
                if indexPath.row == objects.count - 1 {
                    return .insert
                }
                return .delete
            }
        }

## Setting Detail View By Default
