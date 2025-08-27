//
//  EmojiTableViewController.swift
//  TableViews
//
//  Created by Dr Mahika Behal on 18/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    
    var emojis: [Emoji] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load saved emojis or default sample emojis
        if let savedEmojis = Emoji.loadFromFile() {
            emojis = savedEmojis
        } else {
            emojis = Emoji.sampleEmojis()
        }
        
        // Add Edit button to Navigation Bar
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        guard let indexPath = sender as? IndexPath else {
            // For adding a new emoji
            return AddEditTableViewController(coder: coder, emoji: nil)
        }
        // For editing existing emoji
        return AddEditTableViewController(coder: coder, emoji: emojis[indexPath.row])
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell
        cell.updateUI(emoji: emojis[indexPath.row])
        cell.showsReorderControl = true
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            Emoji.saveToFile(emojis: emojis)   // Save after deletion
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedEmoji, at: to.row)
        Emoji.saveToFile(emojis: emojis)   // Save after rearranging
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    @IBAction func unwindToEmojiTVC(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveSegue",
              let addEditTVC = segue.source as? AddEditTableViewController,
              let emoji = addEditTVC.emoji else { return }
        
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else {
            
            emojis.append(emoji)
            let newIndexPath = IndexPath(row: emojis.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .fade)
        }
        
        
        Emoji.saveToFile(emojis: emojis)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "editSegue", sender: indexPath)
    }
}

