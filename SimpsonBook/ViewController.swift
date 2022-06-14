//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ahmet Karamanoğlu on 14.06.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var simpsonsArray = [Simpsons]()
    var choosenSimpson : Simpsons? // nil olarak tanımlayamadık. opsiyonel olarak tanıttık.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        let homer = Simpsons(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "homer")!)
        let marge = Simpsons(name: "Marge Simpson", job: "Housewife", image: UIImage(named: "marge")!)
        let lisa = Simpsons(name: "Lisa Simpson", job: " Student", image: UIImage(named: "lisa")!)

        simpsonsArray.append(homer)
        simpsonsArray.append(marge)
        simpsonsArray.append(lisa)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // sen burda simpsonsArray[indexPath.row] diyince adam senden string istiyor. Eee senin zaten indexlerin bir simpson? O yüzden onların adreslerinden name'ni alabilirsin.
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         choosenSimpson = simpsonsArray[indexPath.row]
         performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController //Gidilecek VC anlamına geliyor destination
            destinationVC.selectedSimpson = choosenSimpson
        }
    }

}

