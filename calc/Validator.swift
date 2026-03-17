//
//  Validator.swift
//  calc
//
//  Created by david on 23/12/1404 AP.
//  Copyright © 1404 AP UTS. All rights reserved.
//

import Foundation

// checks if input to the calculator is valid and throws corresponding error
enum InvalidInputError: Error {
    case incompleteExpression
    case unknownOperator(unknownOperator: String)
    case invalidNumber(invalidNumber: String)
}

class Validator {

    func validate(args: [String]) throws -> Void {
        let operators: [String] = ["x", "/", "%", "+", "-"];
        if (args.count % 2 == 0) {
            throw InvalidInputError.incompleteExpression;
        }
        for i in 0..<args.count {
            if (i % 2 != 0 && !(operators.contains(args[i]))) {
                throw InvalidInputError.unknownOperator(unknownOperator: args[i]);
            }
            if (i % 2 == 0 && Int(args[i]) == nil) {
                throw InvalidInputError.invalidNumber(invalidNumber: args[i]);
            }
        }
    }
}
