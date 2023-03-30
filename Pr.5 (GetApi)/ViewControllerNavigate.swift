//
//  ViewControllerNavigate.swift
//  Pr.5 (GetApi)
//
//  Created by Choudhary Dipika on 28/03/23.
//

import UIKit

class ViewControllerNavigate: UIViewController {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var flagName: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var currencyImage: UIImageView!
    var flagImg = UIImage()
    var flagN = String()
    var flagP = Int()
    var flagC = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagImage.image = flagImg
        flagName.text = flagN
        population.text = "Population : \(flagP)"
        currencyImage.image = flagC
    }
}
