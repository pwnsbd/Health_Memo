//
//  ScrollableDetailedMemoViewController.swift
//  Health Memo
//
//  Created by Pawan on 10/27/20.
//

import UIKit
import Parse

class ScrollableDetailedMemoViewController: UIViewController {

    var Memo : PFObject?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstQuesLabel: UILabel!
    @IBOutlet weak var secondQuesLabel: UILabel!
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var thirdQuesLabel: UILabel!
    
    @IBOutlet weak var SecondAnswer: UILabel!
    
    @IBOutlet weak var ThirdAnswer: UILabel!
    @IBOutlet weak var FourtAnswer: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dayRating = Memo?["dayRating"] as? String
        dateLabel.text = Memo?["date"] as? String
        rating.image = UIImage(named: "regular_" + dayRating!)
        SecondAnswer.text = Memo?["SecondAnswer"] as? String
        ThirdAnswer.text = Memo?["ThirdAnswer"] as? String
        FourtAnswer.text = Memo?["FourthAnswer"] as? String

        // Do any additional setup after loading the view.
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
