//
//  MainPage.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 26.07.2025.
//
import XCTest

final class MainPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["mainTitle"].firstMatch
    }

    private var emailField: XCUIElement {
        return app.textFields["emailInput"].firstMatch
    }

    private var loginButton: XCUIElement {
        return app.buttons["navigationButton"].firstMatch
    }
    
    private var checkButton: XCUIElement {
        return app.buttons["checkButton"].firstMatch
    }
    
    private var failureText: XCUIElement {
        return app.staticTexts["failureText"].firstMatch
    }
    
    private var successText: XCUIElement {
        return app.staticTexts["successText"].firstMatch
    }

    @discardableResult
    func checkPageIsOpened() -> Self{
        XCTAssert(screenTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPageIsNonOpened() -> Self{
        XCTAssert(screenTitle.waitForNonExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkEmailFieldIsDisplayed() -> Self{
        XCTAssert(emailField.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkLoginButtonIsDisplayed() -> Self{
        XCTAssert(loginButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkCheckButtonIsDisplayed() -> Self{
        XCTAssert(checkButton.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func tapLoginButton() -> Self{
        loginButton.tap()
        return self
    }
    
    @discardableResult
    func tapCheckButton() -> Self{
        checkButton.tap()
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
    func failureTextIsDisplayed() -> Self{
        XCTAssert(failureText.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func successTextIsDisplayed() -> Self{
        XCTAssert(successText.waitForExistence(timeout: 5))
        return self
    }
    
}
