//
//  EditUserPage.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class EditUserPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var screenTitle: XCUIElement {
        return app.staticTexts["Редактировать профиль"].firstMatch
    }

    private var nameField: XCUIElement {
        return app.textFields["nameField"].firstMatch
    }

    private var saveButton: XCUIElement {
        return app.buttons["saveButton"].firstMatch
    }
    
    private var cancelButton: XCUIElement {
        return app.buttons["cancelButton"].firstMatch
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
    func checkNameFieldIsDisplayed() -> Self{
        XCTAssert(nameField.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkSaveButtonIsDisplayed() -> Self{
        XCTAssert(saveButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkCancelButtonIsDisplayed() -> Self{
        XCTAssert(cancelButton.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func tapSaveButton() -> Self{
        saveButton.tap()
        return self
    }
    
    @discardableResult
    func tapCancelButton() -> Self{
        cancelButton.tap()
        return self
    }

    @discardableResult
    func typeName(name: String) -> Self{
        nameField.tap()
        nameField.doubleTap()
        nameField.typeText(name)
        return self
    }

    @discardableResult
    func checkTypedName(name: String) -> Self{
        XCTAssert(nameField.value.debugDescription.contains(name))
        return self
    }
    
    @discardableResult
    func checkSaveButtonIsNotEnable() -> Self{
        XCTAssert(!saveButton.isEnabled)
        return self
    }
}
