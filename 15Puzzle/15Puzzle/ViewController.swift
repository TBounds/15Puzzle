//
//  ViewController.swift
//  15Puzzle
//
//  Created by Tyler James Bounds on 1/26/17.
//  Copyright © 2017 Tyler James Bounds. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var boardView: BoardView!
    
    @IBAction func tileSelected(_ sender: UIButton) {
        
        let tag = sender.tag
        NSLog("tileSelected: \(tag)")
        
    }
    
    @IBAction func shuffleTiles(_ sender: AnyObject) {
        
        NSLog("Shuffle")
        
    }
}

