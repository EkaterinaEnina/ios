//
//  UserPageTests.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class UserPageTests: XCTestCase {
    
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
    
    @MainActor
    func openUserScreen() throws {
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
    }
    
    @MainActor
    func testLogoutButtonOnUserScreen() throws {
        try openUserScreen()
        
        userPage
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
        
        mainPage.checkPageIsOpened()
        userPage.checkPageIsNonOpened()
    }
    
    @MainActor
    func testEditUserButtonOnUserScreen() throws {
        try openUserScreen()
        
        userPage
            .checkEditProfileButtonIsDisplayed()
            .tapEditProfileButton()
        
        editUserPage
            .checkPageIsOpened()
            .checkCancelButtonIsDisplayed()
            .tapCancelButton()
        
        userPage
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
        mainPage.checkPageIsOpened()
    }
    
    @MainActor
    func testAllElementsDisplayedOnUserScreen() throws {
        try openUserScreen()
        
        userPage
            .checkEditProfileButtonIsDisplayed()
            .checkPhoto1IsDisplayed()
            .checkPhoto2IsDisplayed()
            .checkPhoto3IsDisplayed()
            .checkPhoto4IsDisplayed()
            .checkAgeLabelIsDisplayed()
            .checkUserNameIsDisplayed()
            .checkLikesCountIsDisplayed()
            .checkFollowersCountIsDisplayed()
            .checkLogoutButtonIsDisplayed()
            .checkEditProfileButtonIsDisplayed()
        
        userPage
            .checkLogoutButtonIsDisplayed()
            .tapLogoutButton()
        mainPage.checkPageIsOpened()
    }
}
