//
//  RatingViewController.swift
//  mrate
//
//  Created by user236018 on 2/11/23.
//

import UIKit

protocol RatingViewControllerDelegate : NSObjectProtocol{
    func setRatingInMainView(rating:String)
}
class RatingViewController: UIViewController {

    @IBOutlet weak var sgmtEditMode: UISegmentedControl!
    var ratingValue = "NA"
    
    weak var delegate: RatingViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ratingValueChanged(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func ratingValueChanged(_ sender: Any) {
        if sgmtEditMode.selectedSegmentIndex == 0{
            sgmtEditMode.selectedSegmentTintColor = UIColor.cyan
            ratingValue = "1"
        }
        else if sgmtEditMode.selectedSegmentIndex == 1{
            sgmtEditMode.selectedSegmentTintColor = UIColor.cyan
            ratingValue = "2"
        }
        else if sgmtEditMode.selectedSegmentIndex == 2{
            sgmtEditMode.selectedSegmentTintColor = UIColor.cyan
            ratingValue = "3"
        }
        else if sgmtEditMode.selectedSegmentIndex == 3{
            sgmtEditMode.selectedSegmentTintColor = UIColor.cyan
            ratingValue = "4"
        }
        else if sgmtEditMode.selectedSegmentIndex == 4{
            sgmtEditMode.selectedSegmentTintColor = UIColor.cyan
            ratingValue = "5"
        }
        else {
            sgmtEditMode.selectedSegmentTintColor = UIColor.clear
            ratingValue = "0"
        }
    }
    
    @IBAction func cancelButtonClick(_ sender: Any) {
        if let delegate = delegate{
            delegate.setRatingInMainView(rating: "NA")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savebuttonClick(_ sender: Any) {
        if let delegate = delegate{
            delegate.setRatingInMainView(rating: ratingValue)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
