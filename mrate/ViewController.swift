//
//  ViewController.swift
//  mrate
//
//  Created by user236018 on 2/11/23.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate, RatingViewControllerDelegate {

    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var mealName: UITextField!
    @IBOutlet weak var ratingValue: UILabel!
    
    var currentRating: Restaurant?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let textFields: [UITextField] = [restaurantName, mealName]
        
        for textfield in textFields{
            textfield.addTarget(self,
                                action: #selector(UITextFieldDelegate.textFieldShouldEndEditing(_:)),
                                for: UIControl.Event.editingDidEnd)
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if currentRating == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentRating = Restaurant(context: context)
        }
        currentRating?.name = restaurantName.text
        currentRating?.meal = mealName.text
        return true
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
        if currentRating == nil {
            let context = appDelegate.persistentContainer.viewContext
            currentRating = Restaurant(context: context)
        }
        currentRating?.rating = Int16(rating) ?? 0
        
    }
    
    @objc func saveRating(){
        appDelegate.saveContext()
    }
}
