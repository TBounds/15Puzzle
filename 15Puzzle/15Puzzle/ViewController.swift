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
        
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let board = appDelegate.board   // get model from app delegate
    
        
        let position = board!.getRowAndColumn(forTile: sender.tag)
        let buttonBounds = sender.bounds
        var buttonCenter = sender.center
        var slide = true
        
        let canSlide = board!.canSlideTile(atRow: (position.row), Column: (position.column))
        
        switch canSlide {
        case .up:
            buttonCenter.y -= buttonBounds.size.height
            break
        case .down:
            buttonCenter.y += buttonBounds.size.height
            break
        case .left:
            buttonCenter.x -= buttonBounds.size.width
            break
        case .right:
            buttonCenter.x += buttonBounds.size.width
            break
        default:
            slide = false;
        }
        
        if slide {
            board!.slideTile(atRow: position.row, Column: position.column, dir: canSlide)
            
            UIView.animate(withDuration: 0.5, animations: {sender.center = buttonCenter})
            if(board!.isSolved()){
                NSLog("Solved")
            }
        }
        

    }
    
    @IBAction func shuffleTiles(_ sender: AnyObject) {
        
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let board = appDelegate.board   // get model from app delegate
        
        
        board!.scramble(numTimes: 150)
        
        self.boardView.setNeedsLayout()
        
    }
}

