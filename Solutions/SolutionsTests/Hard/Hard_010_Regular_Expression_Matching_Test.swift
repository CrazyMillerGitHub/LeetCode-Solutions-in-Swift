//
//  Hard_010_Regular_Expression_Matching_Test.swift
//  Solutions
//
//  Created by Wu, Di on 3/27/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Hard_010_Regular_Expression_Matching_Test: XCTestCase, SolutionsTestCase {
    func test_001() {
        let input: [String] = ["aa", "a"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [String] = ["aa", "aa"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [String] = ["aaa", "aa"]
        let expected: Bool = false
        asyncHelper(input: input, expected: expected)
    }
    func test_004() {
        let input: [String] = ["aa", "a*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_005() {
        let input: [String] = ["aa", ".*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_006() {
        let input: [String] = ["ab", ".*"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_007() {
        let input: [String] = ["aab", "c*a*b"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_008() {
        let input: [String] = ["aaaaab", "c*a*b"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    func test_009() {
        let input: [String] = ["ab", "c*ab"]
        let expected: Bool = true
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: [String], expected: Bool) {
        weak var expectation: XCTestExpectation? = self.expectation(description:timeOutName())
        serialQueue().async(execute: { () -> Void in
            let result = Hard_010_Regular_Expression_Matching.isMatch(s: input[0], p: input[1])
            assertHelper(result == expected, problemName:self.problemName(), input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(timeout:timeOut()) { (error: Error?) -> Void in
            if error != nil {
                assertHelper(false, problemName:self.problemName(), input: input, resultValue:self.timeOutName(), expectedValue: expected)
            }
        }
    }
}
