//
//  ViewController.swift
//  landMarkBookAppLast
//
//  Created by Ali on 19.11.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    var chosenLandMarkNames = ""
    var chosenLandMarkImages = UIImage()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        landMarkNames.append("colosseum")
        landMarkNames.append("great wall")
        landMarkNames.append("kremlin")
        landMarkNames.append("stonhenge")
        landMarkNames.append("taj mahal")

        landMarkImages.append(UIImage(named: "colosseum")!)
        landMarkImages.append(UIImage(named: "great wall")!)
        landMarkImages.append(UIImage(named: "kremlin")!)
        landMarkImages.append(UIImage(named: "stonhenge")!)
        landMarkImages.append(UIImage(named: "taj mahal")!)

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landMarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade
             )
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenLandMarkNames = landMarkNames[indexPath.row]
         chosenLandMarkImages = landMarkImages[indexPath.row]
        
        
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedlandMarkName = chosenLandMarkNames
            destinationVC.selecetedLandMarkImage = chosenLandMarkImages
        }
    }
}

