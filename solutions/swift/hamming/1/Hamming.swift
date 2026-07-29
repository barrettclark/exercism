//
//  Hamming.swift
//  Hamming
//
//  Created by Barrett Clark on 4/17/15.
//  Copyright (c) 2015 Sabre Labs. All rights reserved.
//

import Foundation

class Hamming {
    class func compute(strand1: String, against strand2: String) -> Int {
        // nucleotides are the individual letters
        let strand1Nucleotides = Array(strand1)
        let strand2Nucleotides = Array(strand2)
        let nucleotidePairs = Array(zip(strand1Nucleotides, strand2Nucleotides))
        let hamming = nucleotidePairs.reduce(0) {
            (total, pair) in
            let i = pair.0 != pair.1 ? 1 : 0
            return total + i
        }
        return hamming
    }
}