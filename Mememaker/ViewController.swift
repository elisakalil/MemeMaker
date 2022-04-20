//
//  ViewController.swift
//  Mememaker
//
//  Created by Elisa Kalil on 19/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var memeImage: UIImageView!
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    
    let truck = CaptionOption(emoji: "🚚", caption: "Caminhão passou por cima de mim")
    let pop = CaptionOption(emoji: "💩", caption: "Depois da sexta")
    let alien = CaptionOption(emoji: "👽", caption: "O responsável pelos problemas d aminha vida")
    let lizard = CaptionOption(emoji: "🦎", caption: "Virei Jacaré ano passado, agora só viro cerveja")
    let sad = CaptionOption(emoji: "🫥", caption: "Não tô pronto pra segunda-feira")
    let smile = CaptionOption(emoji: "🙃", caption: "Pode vir segunda-feira!")


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        var topChoices = [truck, pop, alien]
        var bottomChoices = [lizard, sad, smile]
        
        insertStatements(choices: topChoices, segmented: topSegmentedControl)
        insertStatements(choices: bottomChoices, segmented: bottomSegmentedControl)
        
    }
    
    func insertStatements(choices: [CaptionOption], segmented: UISegmentedControl) {
        for choice in choices {
            segmented.insertSegment(withTitle: choice.emoji, at: choices.count, animated: false)
        }
    }

    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.titleForSegment(at: sender.selectedSegmentIndex) {
        case "🚚":
            topCaptionLabel.text = truck.caption
        case "💩":
            topCaptionLabel.text = pop.caption
        case "👽":
            topCaptionLabel.text = alien.caption
        case "🦎":
            bottomCaptionLabel.text = lizard.caption
        case "🫥":
            bottomCaptionLabel.text = sad.caption
        case "🙃":
            bottomCaptionLabel.text = smile.caption
        default:
            bottomCaptionLabel.text = ""
        }
    }
}

