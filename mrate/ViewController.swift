//
//  ViewController.swift
//  mrate
//
//  Created by user236018 on 2/11/23.
//

import UIKit

class FirstViewController: UIViewController, RatingViewControllerDelegate {

    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var ratingValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func rateTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "GetRatingView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GetRatingView"){
            let displayVC = segue.destination as! RatingViewController
            displayVC.delegate = self
        }
    }
    
    func setRatingInMainView(rating: String) {
        ratingValue.text = rating
    }
}

