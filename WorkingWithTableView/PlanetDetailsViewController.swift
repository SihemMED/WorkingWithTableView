//
//  PlanetDetailsViewController.swift
//  WorkingWithTableView
//
//  Created by Sihem MOHAMED on 10/10/19.
//  Copyright © 2019 Simo. All rights reserved.
//

import UIKit

class PlanetDetailsViewController: UIViewController {

    var planet : Planet!
    
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetDetailsLabel: UILabel!
    @IBOutlet weak var planetDiameterLabel: UILabel!
    @IBOutlet weak var planetMassLabel: UILabel!
    @IBOutlet weak var planetTemperatureLabel: UILabel!
    @IBOutlet weak var planetDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        planetImageView.image = UIImage(named: planet.name)
        planetNameLabel.text = planet.name
        planetDetailsLabel.text = "Details"
        planetDiameterLabel.text = "Diameter\n\(planet.diameter) km"
        planetTemperatureLabel.text = "Temperature\n"+planet.temperature
        planetMassLabel.text = "Mass\n"+planet.mass
        
        let attributedString1 = NSMutableAttributedString(string: "Length of year(orbit)\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        let attributedString2 = NSAttributedString(string: planet.lengthOfYear, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        attributedString1.append(attributedString2)
        
        let attributedString3 = NSMutableAttributedString(string: "\nLength of day\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        let attributedString4 = NSAttributedString(string: planet.lengthOfDay, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        attributedString3.append(attributedString4)
        
        let attributedString5 = NSMutableAttributedString(string: "\nVisitors\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        let attributedString6 = NSAttributedString(string: planet.visitors, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        attributedString5.append(attributedString6)
        
        let attributedString7 = NSMutableAttributedString(string: "\nDescription\n", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
        let attributedString8 = NSAttributedString(string: planet.description, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        attributedString7.append(attributedString8)
        
        let descriptionAttributedString = NSMutableAttributedString(attributedString: attributedString1)
        descriptionAttributedString.append(attributedString3)
        descriptionAttributedString.append(attributedString5)
        descriptionAttributedString.append(attributedString7)
        planetDescriptionTextView.attributedText = descriptionAttributedString
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
