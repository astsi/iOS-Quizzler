//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Aleksa Novcic on 14.2.22..
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let text: String
    let answer: Bool
    
    init(q: String, a: Bool){
        text = q
        answer = a
    }
}

