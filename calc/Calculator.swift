//
//  Calculator.swift
//  calc
//
//  Created by david on 16/12/1404 AP.
//  Copyright © 1404 AP UTS. All rights reserved.
//

import Foundation

class Calculator {
    var currentResult = 0;
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func modulus(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }

    func calculate(args: [String]) -> String {
        currentResult = Int(args[0])!;
        for (index, item) in args.enumerated() {
            if (index == 0) {
                continue;
            }
            switch(item) {
                case "+":
                    currentResult = add(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "-":
                    currentResult = subtract(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "x":
                    currentResult = multiply(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "/":
                    currentResult = divide(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "%":
                    currentResult = modulus(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                default:
                    break;
            }
        }
        let result = String(currentResult);
        return(result);
    }
}
