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
        let precOperators: [String] = ["x", "/", "%"];
        var currentResult: Int = Int(args[0])!;
        var index: Int = 1;
        while index < args.count {
            switch (args[index]) {
                case "x":
                    if (index - 2 >= 0) {
                        if (args[index - 2] == "+") {
                            let mResult = multiply(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = add(no1: currentResult, no2: mResult);
                            break;
                        } else if (args[index - 2] == "-") {
                            let mResult = multiply(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = subtract(no1: currentResult, no2: mResult);
                            break;
                        }
                    }
                    currentResult = multiply(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "/":
                    if (index - 2 >= 0) {
                        if (args[index - 2] == "+") {
                            let dResult = divide(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = add(no1: currentResult, no2: dResult);
                            break;
                        } else if (args[index - 2] == "-") {
                            let dResult = divide(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = subtract(no1: currentResult, no2: dResult);
                            break;
                        }
                    }
                    currentResult = divide(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "%":
                    if (index - 2 >= 0) {
                        if (args[index - 2] == "+") {
                            let moResult = modulus(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = add(no1: currentResult, no2: moResult);
                            break;
                        } else if (args[index - 2] == "-") {
                            let moResult = modulus(no1: Int(args[index - 1])!, no2: Int(args[index + 1])!);
                            currentResult = subtract(no1: currentResult, no2: moResult);
                            break;
                        }
                    }
                    currentResult = modulus(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "+":
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        index += 1;
                        break;
                    }
                    currentResult = add(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                case "-":
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        index += 1;
                        break;
                    }
                    currentResult = subtract(no1: currentResult, no2: Int(args[index + 1])!);
                    break;
                default:
                    break;
            }
            index += 1;
        }
        let result = String(currentResult);
        return(result);
    }
}
