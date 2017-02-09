//
//  FifteenBoard.swift
//  15Puzzle
//
//  Created by Tyler James Bounds on 1/27/17.
//  Copyright © 2017 Tyler James Bounds. All rights reserved.
//

import Foundation

enum canSlide {case left, right, up, down, cant}

class FifteenBoard {
    
    
    var  state : [[Int]] = [
        [1, 2, 3, 4],
        [5, 6, 7, 8],
        [9, 10, 11, 12],
        [13, 14, 15, 0] // 0 is the empty slot.
    ]
    
    
    func scramble(numTimes n : Int){
        
        for _ in 0 ..< n {
            let zeroPos = getRowAndColumn(forTile: 0)
            
            let slideDir = findSlideDirectionsForZero(atRow: zeroPos.row, atColumn: zeroPos.column)
            
            let randomIndex = Int(arc4random_uniform(UInt32(slideDir.count)))
            
            // Randomly choose a direction for the 0 to slide.
            switch slideDir[randomIndex] {
            case .up:
                slideTile(atRow: (zeroPos.row - 1), Column: zeroPos.column, dir: .down)
                break
            case .down:
                slideTile(atRow: (zeroPos.row + 1), Column: zeroPos.column, dir: .up)
                break
            case .left:
                slideTile(atRow: zeroPos.row, Column: (zeroPos.column - 1), dir: .right)
                break
            case .right:
                slideTile(atRow: zeroPos.row, Column: (zeroPos.column + 1), dir: .left)
                break
            default:
                break;
                
                
            }
        }
        
    }
    
    // Find which directions the zero tile can slide.
    func findSlideDirectionsForZero(atRow r : Int, atColumn c : Int) -> [canSlide]{
    
        var slideDir: [canSlide] = []
        
        if r > 0 {
            slideDir += [.up]
        }
        if r < 3 {
            slideDir += [.down]
        }
        if c > 0 {
            slideDir += [.left]
        }
        if c < 3 {
            slideDir += [.right]
        }
        
        return slideDir
        
    }
    
    // Returns the value of the tile at location (r,c)
    func getTile(atRow r : Int, atColumn c : Int) -> Int {
        
        return state[r][c];
    }
    
    // Returns the row and column for a tile of a specific value.
    func getRowAndColumn(forTile tile : Int) -> (row : Int, column : Int) {
     
        for r in 0..<4 {
            for c in 0..<4{
                if state[r][c] == tile {
                    return (r,c)
                }
            }
        }
        
        return(0,0) // Is this what I want to return?
        
    }
    
    // Returns true if the puzzle is solved, false if otherwise.
    func isSolved() -> Bool {
        
        for r in 0..<4 {
            for c in 0..<4 {
                if (r*4 + c + 1) != state[r][c] && (r <= 3 && c < 3){
                    return false
                }
            }
        }
   
        return true
    }
    
    func canSlideTileUp(atRow r : Int, Column c : Int) -> Bool {
        
        // If the tile is in the top row, cannot slide up.
        if r == 0 {
            return false;
        }
        
        // Check if the tile above is 0.
        if state[r - 1][c] == 0 {
            return true
        }
        else{
            return false
        }
        
    }
    
    func canSlideTileDown(atRow r : Int, Column c : Int) -> Bool {
        
        // If the tile is in the bottom row, cannot slide down.
        if r == 3 {
            return false;
        }
        
        // Check if the tile below is 0.
        if state[r + 1][c] == 0 {
            return true
        }
        else{
            return false
        }
        
    }
    
    func canSlideTileLeft(atRow r : Int, Column c : Int) -> Bool {
        
        // If the tile is in the furthest left column, cannot slide left.
        if c == 0 {
            return false;
        }
        
        // Check if the tile to the left is 0.
        if state[r][c - 1] == 0 {
            return true
        }
        else{
            return false
        }
        
    }
    
    func canSlideTileRight(atRow r : Int, Column c : Int) -> Bool {
        
        // If the tile is in the furthest right column, cannot slide right.
        if c == 3 {
            return false;
        }
        
        // Check if the tile to the right is 0.
        if state[r][c + 1] == 0 {
            return true
        }
        else{
            return false
        }
    }
    
    // Returns an enum for the direction a tile at (r,c) can slide.
    func canSlideTile(atRow r : Int, Column c : Int) -> canSlide {
        
        if canSlideTileUp(atRow: r, Column: c) {
            return canSlide.up
        }
        
        if canSlideTileDown(atRow: r,Column: c) {
            return canSlide.down
        }
        
        if canSlideTileLeft(atRow: r, Column: c) {
            return canSlide.left
        }
        
        if canSlideTileRight(atRow: r,Column: c) {
            return canSlide.right
        }
        
        return canSlide.cant
    }
    
    // Modify state
    func slideTile(atRow r : Int, Column c : Int, dir: canSlide){
        
        switch dir {
        case .up:
            state[r-1][c] = state[r][c]
            state[r][c] = 0;
            break
        case .down:
            state[r+1][c] = state[r][c]
            state[r][c] = 0;
            break
        case .left:
            state[r][c-1] = state[r][c]
            state[r][c] = 0;
            break
        case .right:
            state[r][c+1] = state[r][c]
            state[r][c] = 0;
            break
        default:
            break
        }
        
    }
    
}

