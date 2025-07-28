//
//  LoginPage.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 27.07.2025.
//
import XCTest

final class LoginPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var loginTitle: XCUIElement {
        return app.staticTexts["loginTitle"].firstMatch
    }

    private var emailField: XCUIElement {
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement {
        return app.secureTextFields["passwordField"].firstMatch
    }

    private var loginButton: XCUIElement {
        return app.buttons["loginButton"].firstMatch
    }
    
    private var regButton: XCUIElement {
        return app.buttons["registerButton"].firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.buttons["backButton"].firstMatch
    }

    @discardableResult
    func checkPageIsOpened() -> Self{
        XCTAssert(loginTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPageIsNonOpened() -> Self{
        XCTAssert(loginTitle.waitForNonExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkEmailFieldIsDisplayed() -> Self{
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPasswordFieldIsDisplayed() -> Self{
        XCTAssert(passwordField.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkLoginButtonIsDisplayed() -> Self{
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkRegButtonIsDisplayed() -> Self{
        XCTAssert(regButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkBackButtonIsDisplayed() -> Self{
        XCTAssert(backButton.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func tapLoginButton() -> Self{
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapRegButton() -> Self{
        regButton.tap()
        return self
    }
    
    @discardableResult
    func tapBackButton() -> Self{
        backButton.tap()
        return self
    }

    @discardableResult
    func typeEmail(email: String) -> Self{
        emailField.tap()
        emailField.typeText(email)
        return self
    }

    @discardableResult
    func checkTypedEmail(email: String) -> Self{
        XCTAssert(emailField.value.debugDescription.contains(email))
        return self
    }
    
    @discardableResult
    func typePassword(password: String) -> Self{
        passwordField.tap()
        passwordField.typeText(password)
        return self
    }

    @discardableResult
    func checkTypedPassword(passwordValue: String) -> Self{
        XCTAssert(passwordField.value.debugDescription.contains(passwordValue))
        return self
    }
    
}

