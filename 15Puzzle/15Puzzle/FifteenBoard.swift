//
//  FifteenBoard.swift
//  15Puzzle
//
//  Created by Tyler James Bounds on 1/27/17.
//  Copyright © 2017 Tyler James Bounds. All rights reserved.
//

import Foundation

class FifteenBoard {
    
    var  state : [[Int]] = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 0] // 0 is the empty slot.
    ]
    
    func scramble(numTimes n : Int){
        
    }
    
    func getTile(atRow r : Int, atColumn c : Int) -> Int {
        return 1;
    }
    
    func getRowAndColumn(forTile tile : Int) -> (row : Int, column : Int)? {
     
        return (1,1)
        
    }
    
    func isSolved() -> Bool {
        return false
    }
    
    func canSlideTileUp(atRow r : Int, Column c : Int) -> Bool {
        return false
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool {
        return false
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool {
        return false
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool {
        return false
    }
    
    func canSlideTile(atRow r : Int, Column c : Int) -> Bool {
        return false
    }
    
}

