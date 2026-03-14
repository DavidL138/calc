//
//  Validator.swift
//  calc
//
//  Created by david on 23/12/1404 AP.
//  Copyright © 1404 AP UTS. All rights reserved.
//

import Foundation

class Validator {
    func validate(args: [String]) -> Bool {
        var isValidInput: Bool = true;
        let operators: [String] = ["x", "/", "%", "+", "-"];
        if (args.count % 2 == 0) {
            isValidInput = false;
        }
        for i in 0..<args.count {
            if (i % 2 != 0 && !(operators.contains(args[i]))) {
                isValidInput = false;
            }
        }
        return isValidInput;
    }
}
