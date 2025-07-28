//
//  EditUserPageTests.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class EditUserPageTests: XCTestCase {
    
    let app = XCUIApplication()
    
    private lazy var mainPage = MainPage(app: app)
    private lazy var loginPage = LoginPage(app: app)
    private lazy var userPage = UserPage(app: app)
    private lazy var editUserPage = EditUserPage(app: app)
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func setUp() async throws {
        try await super.setUp()
        await app.launch()
    }
    
    override func tearDown() {
        super.tearDown()

        userPage
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
        mainPage.checkPageIsOpened()
        
        //
    }
    
    @MainActor
    func openEditUserScreen() throws {
        let email = "tester@mail.ru"
        let password = "Qwerty"
        let passwordValue = "••••••"
        
        mainPage
            .checkPageIsOpened()
            .checkLoginButtonIsDisplayed()
            .tapLoginButton()
        loginPage
            .checkPageIsOpened()
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
            .checkEditProfileButtonIsDisplayed()
            .tapEditProfileButton()
        editUserPage
            .checkPageIsOpened()
    }
    
    @MainActor
    func testCancelButtonOnEditUserScreen() throws {
        try openEditUserScreen()
        
        editUserPage
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
            .checkPageIsNonOpened()
        userPage.checkPageIsOpened()
    }
    
    @MainActor
    func testAllElementsDisplayedOnEditUserScreen() throws {
        try openEditUserScreen()
        
        editUserPage
            .checkNameFieldIsDisplayed()
            .checkSaveButtonIsDisplayed()
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
    }
    
    @MainActor
    func testChengeNameOnEditUserScreen() throws {
        try openEditUserScreen()
        let name = " "
        
        editUserPage
            .checkNameFieldIsDisplayed()
            .typeName(name: name)
            .tapSaveButton()
            .checkSaveButtonIsNotEnable()
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
    }
}
