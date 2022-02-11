//
//  ViewController.swift
//  WeArePennState
//
//  Created by Kelly Hutchison on 2/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    // var we plan to change (use "var")
    var count = 0
    var timer: Timer? = nil
    
    // constant we won't change (use "let")
    let targetCount = 8
    
    // only called once
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // button
        button.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        // label
        label.isHidden = true
        
        reset()
    }
    
    private func reset() {
        label.isHidden = true
        count = 0
        button.setTitle("CHEER", for: .normal)
        button.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "student_section")
    }
    
    @objc private func timerDidFinish() {
        timer?.invalidate()
        timer = nil
        reset()
    }

    @objc private func didTapButton(sender: UIButton) {
        print("button pressed")
        
        count += 1
        
        switch count {
        case 1, 3, 5:
            imageView.image = UIImage(named: "we_are")
            label.text = "we are"
        case 2, 4, 6:
            imageView.image = UIImage(named: "penn_state")
            label.text = "penn state"
        case 7:
            imageView.image = UIImage(named: "we_are")
            label.text = "thank you"
        case 8:
            imageView.image = UIImage(named: "penn_state")
            label.text = "you're welcome"
        default:
            break
        }
            
        label.isHidden = false
        
        if count == targetCount {
            button.isUserInteractionEnabled = false
            button.setTitle("Resetting...", for: .normal)
            timer = Timer.scheduledTimer(
                timeInterval: 3,
                target: self,
                selector: #selector(timerDidFinish),
                userInfo: nil,
                repeats: false)
        }
    }
}

