//
//  MainPageTests.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//

import XCTest

final class MainPageTests: XCTestCase {
    
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
        mainPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testCheckFailureEmailOnMainScreen() throws {
        
        let email = "email@email.ru"
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .checkCheckButtonIsDisplayed()
            .typeEmail(email: email)
            .checkTypedEmail(email: email)
            .tapCheckButton()
            .failureTextIsDisplayed()
    }
    
    @MainActor
    func testCheckSuccessEmailOnMainScreen() throws {
        
        let email = "tester@mail.ru"
        
        mainPage
            .checkEmailFieldIsDisplayed()
            .checkCheckButtonIsDisplayed()
            .typeEmail(email: email)
            .checkTypedEmail(email: email)
            .tapCheckButton()
            .successTextIsDisplayed()
    }
    
    @MainActor
    func testNavigateFromMainScreenToLoginScreen() throws {
        
        mainPage
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        
        loginPage.checkPageIsOpened()
        
        mainPage.checkPageIsNonOpened()
    }
    
}
