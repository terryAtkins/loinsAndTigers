//
//  LionCub.swift
//  loinsAndTigers
//
//  Created by terry atkins on 12/03/2015.
//  Copyright (c) 2015 terry atkins. All rights reserved.
//

import Foundation

class LionCub: Lion {
    var randomFactString = ""
    
    override func randomFact() -> String {
    if isAlphaMale {
        randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
    } else {
        randomFactString = "Cubs begin eating meat at about the age of six weeks"
    }
        return randomFactString
    }
}