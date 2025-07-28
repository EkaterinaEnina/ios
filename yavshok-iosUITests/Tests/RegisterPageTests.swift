//
//  RegisterPageTests.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class RegisterPageTests: XCTestCase {
    
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var registerPage = RegisterPage(app: app)
    
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
    func openRegisterScreen() throws {
        mainPage
            .checkPageIsOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        loginPage
            .checkPageIsOpened()
            .checkRegButtonIsDisplayed()
            .tapRegButton()
        registerPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testNavigateFromRegisterScreenToMainScreen() throws {
        try openRegisterScreen()
        
        registerPage
            .checkBackButtonIsDisplayed()
            .tapBackButton()
        loginPage.checkPageIsOpened()
        registerPage.checkPageIsNonOpened()
    }
    
    @MainActor
    func testRegisterExistUserOnRegScreen() throws {
        try openRegisterScreen()
        let email = "tester@mail.ru"
        let password = "111111"
        let age = "33"
        let passwordValue = "••••••"
        
        registerPage
            .checkEmailFieldIsDisplayed()
            .typeEmail(email: email)
            .checkTypedEmail(email: email)
            .checkPasswordFieldIsDisplayed()
            .typePassword(password: password)
            .checkTypedPassword(passwordValue: passwordValue)
            .checkAgeFieldIsDisplayed()
            .typeAge(age: age)
            .checkTypedAge(age: age)
            .checkRegButtonIsDisplayed()
            .tapRegButton()
            .checkValidationErrorIsDisplayed()
            .checkErrorText(errorText: "Пользователь уже зарегистрирован")
    }
    
    @MainActor
    func testRegisterWithoutDataOnRegScreen() throws {
        
        try openRegisterScreen()
        
        registerPage
            .checkEmailFieldIsDisplayed()
            .checkPasswordFieldIsDisplayed()
            .checkAgeFieldIsDisplayed()
            .checkRegButtonIsDisplayed()
            .checkRegButtonIsNotEnabled()
    }
}
