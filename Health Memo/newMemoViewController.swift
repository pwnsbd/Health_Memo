//
//  newMemoViewController.swift
//  Health Memo
//
//  Created by Pawan on 10/25/20.
//
// For pushing
import UIKit
import Parse

class newMemoViewController: UIViewController {

    @IBOutlet weak var newMemoFirstQueLabel: UILabel!
    @IBOutlet weak var newMemoSecondQueLabel: UILabel!
    @IBOutlet weak var newMemoThirdQueLabel: UILabel!
    @IBOutlet weak var newMemoFourthQueLabel: UILabel!
    
    @IBOutlet weak var newMemoFirstAnsLabel: UITextField!
    @IBOutlet weak var newMemoSecondAnsLabel: UITextField!
    @IBOutlet weak var newMemoThirdAnsLabel: UITextField!
    @IBOutlet weak var newMemoFourthAnsLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
     }
    
    @IBAction func onSubmit(_ sender: Any) {
        let newMemo = PFObject(className:"NewMemo")
        newMemo["owner"] = "Pawan"
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let dateString = formatter.string(from: Date())
        newMemo["date"] = dateString
        
        newMemo["dayRating"] = newMemoFirstAnsLabel.text
        newMemo["SecondAnswer"] = newMemoSecondAnsLabel.text
        newMemo["ThirdAnswer"] = newMemoThirdAnsLabel.text
        newMemo["FourthAnswer"] = newMemoFourthAnsLabel.text
        
        newMemo.saveInBackground { (success, error) in
            if (success)
            {
                print("New Memo Saved!")
                self.dismiss(animated: true, completion: nil)
            }
            else{
                print("Error Ocured while saving: \(error?.localizedDescription)")
            }
            
        }
        
    }
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
