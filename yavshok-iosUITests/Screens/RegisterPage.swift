//
//  RegisterPage.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class RegisterPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    //identifier: 'validationError', label: 'Пользователь уже зарегистрирован'
    
    private var registerTitle: XCUIElement {
        return app.staticTexts["registerTitle"].firstMatch
    }
    
    private var validationError: XCUIElement {
        return app.staticTexts["validationError"].firstMatch
    }

    private var emailField: XCUIElement {
        return app.textFields["emailField"].firstMatch
    }
    
    private var passwordField: XCUIElement {
        return app.secureTextFields["passwordField"].firstMatch
    }
    
    private var ageField: XCUIElement {
        return app.textFields["ageField"].firstMatch
    }
    
    private var regButton: XCUIElement {
        return app.buttons["registerButton"].firstMatch
    }
    
    private var backButton: XCUIElement {
        return app.buttons["backButton"].firstMatch
    }

    @discardableResult
    func checkPageIsOpened() -> Self{
        XCTAssert(registerTitle.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPageIsNonOpened() -> Self{
        XCTAssert(registerTitle.waitForNonExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkValidationErrorIsDisplayed() -> Self{
        XCTAssert(validationError.waitForExistence(timeout: 5))
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
    func checkAgeFieldIsDisplayed() -> Self{
        XCTAssert(ageField.waitForExistence(timeout: 5))
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
    
    @discardableResult
    func typeAge(age: String) -> Self{
        ageField.tap()
        ageField.typeText(age)
        return self
    }

    @discardableResult
    func checkTypedAge(age: String) -> Self{
        XCTAssert(ageField.value.debugDescription.contains(age))
        return self
    }
    
    @discardableResult
    func checkErrorText(errorText: String) -> Self{
        XCTAssert(validationError.label.contains(errorText))
        return self
    }
    
    @discardableResult
    func checkRegButtonIsNotEnabled() -> Self{
        XCTAssert(!regButton.isEnabled)
        return self
    }

}


