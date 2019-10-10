//
//  ViewController.swift
//  WorkingWithTableView
//
//  Created by Sihem MOHAMED on 10/10/19.
//  Copyright © 2019 Simo. All rights reserved.
//

import UIKit

struct Planet: Decodable {
    var name: String
    var diameter: Double
    var mass: String
    var description: String
    var lengthOfYear: String
    var lengthOfDay: String
    var temperature: String
    var visitors: String
    var planetType: String
}
struct Response: Decodable {
    var planets : [Planet]
}

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var planetTableView: UITableView!
    
    let cellIdentifier = "planetTableViewCell"
    var planetArray : [Planet] = [Planet]()
    var selectedPlanet : Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromLocalFile()
        setupUI()
    }
    
    @IBAction func segmentedControlAction(_ sender: Any) {
        readFromLocalFile()
        planetTableView.reloadData()
    }
    
    private func setupUI() {
        let titleAttributedString = [NSAttributedString.Key.foregroundColor : UIColor.white]
        segmentedControl.setTitleTextAttributes(titleAttributedString, for: .normal)
        planetTableView.register(UINib(nibName: "PlanetTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        planetTableView.delegate = self
        planetTableView.dataSource = self
    }

    private func readFromLocalFile() {
        let filePath = Bundle.main.path(forResource: "planet", ofType: "json", inDirectory: nil)

               if let filePath = filePath {
                   do {
                        let fileUrl = URL(fileURLWithPath: filePath)
                        let jsonData = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                        let json = try? JSONDecoder().decode(Response.self, from: jsonData)
                    planetArray = segmentedControl.selectedSegmentIndex == 0 ? json!.planets : json!.planets.sorted(by: {$0.diameter < $1.diameter})
                   } catch {
                       print(error)
                       fatalError("Unable to read contents of the file url")
                   }
               }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination: PlanetDetailsViewController = segue.destination as? PlanetDetailsViewController {
            destination.planet = selectedPlanet
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPlanet = planetArray[indexPath.row]
        self.performSegue(withIdentifier: "detailsSegue", sender: self)
        self.planetTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = planetTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlanetTableViewCell
        let planet = planetArray[indexPath.row]
        cell.planetLabel.text = planet.name
        cell.planetImageView.image = UIImage(named: planet.name)
        return cell
    }
}
