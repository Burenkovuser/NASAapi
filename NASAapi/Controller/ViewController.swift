//
//  ViewController.swift
//  NASAapi
//
//  Created by Vasilii on 23/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
     //private let urlNasa = "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo"
    
    private let urlNasa = "https://api.nasa.gov/planetary/apod?api_key=IcHp0GqyNEZdp2aTN3hj86LDIu9gFSo2IGRy4ocY"
    
    var spaceObjects: [SpaceObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       fetchData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spaceObjects.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        let spaceObject = spaceObjects[indexPath.row]
        cell.configur(with: spaceObject)
    
        return cell
    }
    

    
    func fetchData() {
        guard let url = URL(string: urlNasa) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {// если ошибка выходим из метода
                print(error.localizedDescription)
                return
            }
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
            
                do {
                    self.spaceObjects = [try JSONDecoder().decode(SpaceObject.self, from: data)]
                    DispatchQueue.main.async {
                      self.tableView.reloadData()
                   }
                    //print(spaceObjects.title ?? "nil")
                    //print(spaceObjects.explanation ?? "nil")
                } catch let ereor {
                    print(ereor.localizedDescription)
                }
            }.resume()
    }

    /*
 unc getData() {
 
 guard let url = URL(string: jsonUrl) else { return  }
 
 URLSession.shared.dataTask(with: url) { (data, _, _) in
 
 guard let data = data else { return }
 
 do {
 self.allCurrecies = try JSONDecoder().decode([Currency].self, from: data)
 
 DispatchQueue.main.async {
 self.tableView.reloadData()
 }
 
 } catch let error {
 print(error)
 }
 } .resume()
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

    
    // MARK: - Navigation

    /*
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            
            if segue.identifier == "Detail"{
            let detailVC = segue.destination as! DetailViewController
            
                
            }
        
        }
    }
 
 */

 
}
