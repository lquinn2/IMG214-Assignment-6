//
//  CategoryPickerviewController.swift
//  MyLocations
//
//  Created by Student on 2019-03-08.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import UIKit

class TagPickerViewController: UITableViewController {
    var selectedTagName = ""
    
    let tags = [
        "No Tag",
        "Fun",
        "Silly",
        "Wild",
        "Awesome",
        "Scary",
        "Unreal"]
    
    var selectedIndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<tags.count {
            if tags[i] == selectedTagName {
                selectedIndexPath = IndexPath(row: i, section: 0)
                break
            }
        }
    }
    
    // MARK:- Table View Delegates
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                     for: indexPath)
            
            let tagName = tags[indexPath.row]
            cell.textLabel!.text = tagName
            
            if tagName == selectedTagName {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != selectedIndexPath.row {
            if let newCell = tableView.cellForRow(at: indexPath) {
                newCell.accessoryType = .checkmark
            }
            if let oldCell = tableView.cellForRow(
                at: selectedIndexPath) {
                oldCell.accessoryType = .none
            }
            selectedIndexPath = indexPath
        }
    }
    
    // MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?) {
        if segue.identifier == "PickedTag" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                selectedTagName = tags[indexPath.row]
            }
        }
    }
}

