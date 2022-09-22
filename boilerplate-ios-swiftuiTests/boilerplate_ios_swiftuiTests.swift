//
//  boilerplate-ios-swiftuiTests.swift
//  boilerplate-ios-swiftuiTests
//
//  Created by Can Baybunar on 18.11.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import XCTest
import boilerplate_ios_swiftui

class boilerplate_ios_swiftuiTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
    }
    // MARK: - REGEX CASES
    func testAnythingCase() {
        XCTAssertTrue(case1.isEmpty)
        XCTAssertTrue(case1.isValidPassword(minCharCount: 0, maxCharCount: 10, rule: .anything))
        XCTAssertFalse(case1.isValidPassword(minCharCount: 1, maxCharCount: 10, rule: .anything))
        XCTAssertFalse(case1.isValidPassword(minCharCount: 1, maxCharCount: 10, rule: .anything, turkishCharacterAllowed: true))
        XCTAssertTrue(case2.isValidPassword(minCharCount: 1, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case2.isValidPassword(minCharCount: 1, maxCharCount: 20, rule: .anything, turkishCharacterAllowed: true))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 1, maxCharCount: 8, rule: .anything))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 10, maxCharCount: 15, rule: .anything))
        XCTAssertTrue(case3.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case4.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case5.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case6.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case7.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case8.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case9.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case10.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case11.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case12.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case13.isValidPassword(minCharCount: 3, maxCharCount: 10, rule: .anything))
        XCTAssertTrue(case14.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case15.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case16.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case17.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case18.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case19.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case20.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case21.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case22.isValidPassword(minCharCount: 8, maxCharCount: 30, rule: .anything))
        XCTAssertTrue(case23.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case24.isValidPassword(minCharCount: 8, maxCharCount: 20, rule: .anything))
        XCTAssertTrue(case25.isValidPassword(minCharCount: 8, maxCharCount: 30, rule: .anything))
        XCTAssertTrue(case26.isValidPassword(minCharCount: 8, maxCharCount: 30, rule: .anything))
    }

    func testLettersCase() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertTrue(case2.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertTrue(case2.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter, turkishCharacterAllowed: true))
        XCTAssertTrue(case3.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertTrue(case3.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter, turkishCharacterAllowed: true))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertTrue(case4.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter, turkishCharacterAllowed: true))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertTrue(case5.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter, turkishCharacterAllowed: true))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case11.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case25.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
        XCTAssertFalse(case26.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .letter))
    }

    func testNumbersCase() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case3.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertTrue(case6.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case11.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case25.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
        XCTAssertFalse(case26.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .number))
    }

    func testNumberAndLetterCase() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case3.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertTrue(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case8.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertTrue(case9.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case9.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case10.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertTrue(case11.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case11.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertTrue(case12.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter, turkishCharacterAllowed: true))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case25.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
        XCTAssertFalse(case26.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndLetter))
    }

    func testUpperAndLowerCase() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased, turkishCharacterAllowed: true))
        XCTAssertTrue(case3.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertTrue(case3.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertTrue(case5.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .upperLowerCased))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case11.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case25.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
        XCTAssertFalse(case26.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .upperLowerCased))
    }

    func testNumberULCased() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case3.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndULCased))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 30, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertTrue(case11.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertTrue(case11.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertTrue(case12.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased, turkishCharacterAllowed: true))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case25.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
        XCTAssertFalse(case26.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .numberAndULCased))
    }

    // swiftlint:disable:next function_body_length
    func testHighSecure() {
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case1.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case2.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case3.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case3.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case4.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case5.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case6.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case7.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case8.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case9.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case10.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case11.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case11.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case12.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case13.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case14.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case15.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case16.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case17.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case18.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case19.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case20.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case21.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case22.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case23.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertFalse(case24.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertTrue(case25.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertTrue(case25.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
        XCTAssertTrue(case26.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure))
        XCTAssertTrue(case26.isValidPassword(minCharCount: 6, maxCharCount: 50, rule: .highSecure, turkishCharacterAllowed: true))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// MARK: - Example Passwords
let case1 = ""
let case2 = "adshfahaf"
let case3 = "ASfkdjaksaso"
let case4 = "asdfgşiağşqr"
let case5 = "ASDişiĞüç"
let case6 = "143552122"
let case7 = "909313135asafl"
let case8 = "909313135asafliş"
let case9 = "909313135ASAS"
let case10 = "909313135SAŞAŞ"
let case11 = "909313135afdAWRF"
let case12 = "909313135afşıdAĞWRF"
let case13 = "_@*/())"
let case14 = "_@*/())asdaf"
let case15 = "_@*/())asdafığ"
let case16 = "_@*/())ASFSA"
let case17 = "_@*/())SADFĞWQ"
let case18 = "_@*/())ASFAfadga"
let case19 = "_@*/())AĞASFKQksafış"
let case20 = "_@*/())14212412"
let case21 = "_@*/())14212412asfds"
let case22 = "_@*/())14212412asfdığ"
let case23 = "_@*/())14212412ASD"
let case24 = "_@*/())14212412ASDĞİ"
let case25 = "_@*/())14212412asfASD"
let case26 = "_@*/())14212412asğfAŞD"
