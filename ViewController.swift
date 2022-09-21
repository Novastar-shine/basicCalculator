//
//  ViewController.swift
//  BasicCalculator
//
//  Created by Kanykey Albanova on 2022-09-20.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var calculatorWorking: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    @IBAction func clearTap(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func changeValueSign(_ sender: Any) {
        addToWorking(value: "*-1")
    }
    @IBAction func percentageTap(_ sender: Any) {
        addToWorking(value: "/100")

    }
    @IBAction func divideTap(_ sender: Any) {
        addToWorking(value: "/")

    }
    @IBAction func multiplicationTap(_ sender: Any) {
        addToWorking(value: "*")

    }
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorking(value: "-")

    }
    
    @IBAction func additionTap(_ sender: Any) {
        addToWorking(value: "+")

    }
    
    @IBAction func equalTap(_ sender: Any) {
        if(validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkedWorkingsForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calculatorResult.text = resultString
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "Cannot do the math! ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
   
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")

    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")

    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")

    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")

    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")

    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")

    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")

    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")

    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")

    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")

    }
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorking(value: ".")

    }
    
    
    
    var workings: String = ""
    func clearAll(){
        workings = ""
        calculatorWorking.text = ""
        calculatorResult.text = ""
    }
    func addToWorking(value: String){
        workings = workings + value
        calculatorWorking.text = workings
    }

    func validInput() ->Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
           if(specialCharacter(char: char)){
               funcCharIndexes.append(count)
           }
            count+=1
        }
        var previous: Int = -1
        for index in funcCharIndexes
        {
            if(index == 0){
                return false
            }
            if (index == workings.count-1){
                return false
            }
            if(previous != -1){
                if(index-previous == 1){
                    return false
                }
            }
            previous = index
        }
        return true
    }

    func specialCharacter(char: Character) -> Bool{
        if(char == "*"){
            return true
        }; if (char == "/"){
            return true
        }; if (char == "+"){
            return true
        }; if (char == "-"){
            return true
        }
        return false
    }
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else{
            return String(format: "%.2f", result)
        }
    }

    
}

