//
//  ViewController.swift
//  Silly Song
//
//  Created by Debidutt on 28/05/2017.
//  Copyright © 2017 botconsultancy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
    }
    
    
    @IBAction func reset(_ sender: Any) {
        nameField.autocapitalizationType = .allCharacters
        nameField.text = ""
        lyricsView.text = ""
    }
    

    @IBAction func displayLyrics(_ sender: Any) {
        
        let fullName:String = nameField.text!
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: fullName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func shortNameForName(name : String) -> String {
    
    let lowercaseName = name.lowercased()
    
    let vowelSet = CharacterSet(charactersIn : "aeiou")
    
    var shortName = ""
    
    if let matches = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive, range: lowercaseName.startIndex..<lowercaseName.endIndex){
        shortName = lowercaseName.substring(from:matches.lowerBound)
    }
    
    return shortName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let song = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameForName(name: fullName))
    
    return song
}
