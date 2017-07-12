//
//  ViewController.swift
//  Tax_Calculator_SE
//
//  Created by Ulad Daratsiuk-Demchuk on 7/9/17.
//  Copyright © 2017 Ulad Daratsiuk. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var output: UILabel!

    @IBOutlet weak var input: UILabel!
    
    @IBOutlet weak var taxLbl: UILabel!
    
    var stillTyping = false
    var taxPercent = [0.28, 0.2363, 0.212]
    var nettoPercent = [0.7637, 0.72, 0.788]
    
    @IBAction func numButton(_ sender: UIButton) {
        
          let number = sender.currentTitle!
        
                if stillTyping{
                        if (input.text?.characters.count)! < 6 {
        
                            input.text = input.text! + number
        
                            func sum()->Double{
                                let b = Int(input.text!)
                                if b! > 38000 {
                                let result = round(nettoPercent[1]*Double(b!))
                                return result }else if b! < 25000 {
                                    let result = round(nettoPercent[2]*Double(b!))
                                return result
                                }else if b! < 13000{let result = round(0)
                                   return result
                                }else{
                                    let result = round(nettoPercent[0]*Double(b!))
                                    return result}
                                }
                            
                                func sumTax()->Double{
                                    let b = Int(input.text!)
                                     if b! > 38000 {
                                    let result = round(taxPercent[0]*Double(b!))
                                        return result}else if b! < 25000 {
                                        let result = round(taxPercent[2]*Double(b!))
                                        return result
                                    }
                                    else if b! < 13000 {
                                            let result: Double = 0
                                            return result
                                     }else {
                                    let result = round(taxPercent[1]*Double(b!))
                                    return result
                                    }
                                    
        
        
    }
    
        output.text = String (sum())
                            taxLbl.text = String(sumTax())
        }
        }else {
        input.text = number
            stillTyping = true
        }
    
    }
    
    //FIXIT: HERE
    

    @IBAction func clearButton(_ sender: UIButton) {
        output.text = "0"
        input.text = output.text
        taxLbl.text = output.text
        stillTyping = false
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "view2", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

