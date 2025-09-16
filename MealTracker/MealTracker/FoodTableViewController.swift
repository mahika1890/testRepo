//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by mahika behal on 04/09/25.
//


struct Food {
    let name: String
    let description: String
}
struct Meal {
    let name: String
    let food: [Food]
}

import UIKit

class FoodTableViewController: UITableViewController {
    
    // Computed property returning 3 meals
    var meals: [Meal] {
        let breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Pancakes", description: "Fluffy and sweet"),
            Food(name: "Omelette", description: "Eggs with veggies"),
            Food(name: "Toast", description: "With butter and jam")
        ])
        
        let lunch = Meal(name: "Lunch", food: [
            Food(name: "Burger", description: "Cheesy beef burger"),
            Food(name: "Salad", description: "Fresh veggies"),
            Food(name: "Soup", description: "Warm and healthy")
        ])
        
        let dinner = Meal(name: "Dinner", food: [
            Food(name: "Pizza", description: "Cheesy goodness"),
            Food(name: "Pasta", description: "Creamy Alfredo"),
            Food(name: "Steak", description: "Grilled to perfection")
        ])
        
        return [breakfast, lunch, dinner]
    }
    
    // MARK: - TableView DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let meal = meals[indexPath.section]
        let foodItem = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = foodItem.name
        content.secondaryText = foodItem.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


