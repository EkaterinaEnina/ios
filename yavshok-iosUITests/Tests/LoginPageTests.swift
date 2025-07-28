//
//  MainPageTests.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//

import XCTest

final class LoginPageTests: XCTestCase {
    
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    private lazy var userPage = UserPage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
    }
    
    @MainActor
    func openLoginScreen() throws {
        //открытие страницы логина (через setUp не работает)
        mainPage
            .checkPageIsOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        loginPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testNavigateFromLoginScreenToMainScreen() throws {
        try openLoginScreen()
        
        loginPage
            .checkBackButtonIsDisplayed()
            .tapBackButton()
        
        mainPage.checkPageIsOpened()
        loginPage.checkPageIsNonOpened()
    }
    
    @MainActor
    func testNavigateFromLoginScreenToRegScreen() throws {
        try openLoginScreen()
        
        loginPage
            .checkRegButtonIsDisplayed()
            .tapRegButton()
        
        registerPage.checkPageIsOpened()
        loginPage.checkPageIsNonOpened()
    }
    
    @MainActor
    func testAuthorizationOfUserOnLoginScreen() throws {
        try openLoginScreen()
        
        let email = "tester@mail.ru"
        let password = "Qwerty"
        let passwordValue = "••••••"
        
        loginPage
            .checkEmailFieldIsDisplayed()
            .checkLoginButtonIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .typeEmail(email: email)
            .checkTypedEmail(email: email)
            .typePassword(password: password)
            .checkTypedPassword(passwordValue: passwordValue)
            .tapLoginButton()
        
        userPage
            .checkPageIsOpened()
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()        
    }
}
