//
//  UserPage.swift
//  yavshok-ios
//
//  Created by Екатерина Енина on 28.07.2025.
//
import XCTest

final class UserPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    private var profileImage: XCUIElement {
        return app.images["profileImage"].firstMatch
    }

    private var userName: XCUIElement {
        return app.staticTexts["userName"].firstMatch
    }
    
    private var ageLabel: XCUIElement {
        return app.staticTexts["ageLabel"].firstMatch
    }

    private var logoutButton: XCUIElement {
        return app.buttons["logoutButton"].firstMatch
    }
    
    private var editProfileButton: XCUIElement {
        return app.buttons["editProfileButton"].firstMatch
    }
    
    private var postsCount: XCUIElement {
        return app.staticTexts["postsCount"].firstMatch
    }
    
    private var followersCount: XCUIElement {
        return app.staticTexts["followersCount"].firstMatch
    }

    private var likesCount: XCUIElement {
        return app.staticTexts["likesCount"].firstMatch
    }
    
    private var photo1: XCUIElement {
        return app.images["photo1"].firstMatch
    }

    private var photo2: XCUIElement {
        return app.images["photo2"].firstMatch
    }

    private var photo3: XCUIElement {
        return app.images["photo3"].firstMatch
    }

    private var photo4: XCUIElement {
        return app.images["photo4"].firstMatch
    }
    
    @discardableResult
    func checkPageIsOpened() -> Self{
        XCTAssert(profileImage.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPageIsNonOpened() -> Self{
        XCTAssert(profileImage.waitForNonExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkUserNameIsDisplayed() -> Self{
        XCTAssert(userName.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkAgeLabelIsDisplayed() -> Self{
        XCTAssert(ageLabel.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLogoutButtonIsDisplayed() -> Self{
        XCTAssert(logoutButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkEditProfileButtonIsDisplayed() -> Self{
        XCTAssert(editProfileButton.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func tapLogoutButton() -> Self{
        logoutButton.tap()
        return self
    }
    
    @discardableResult
    func tapEditProfileButton() -> Self{
        editProfileButton.tap()
        return self
    }

    @discardableResult
    func checkUserName(name: String) -> Self{
        XCTAssert(userName.label.contains(name))
        return self
    }
    
    @discardableResult
    func checkPostsCountIsDisplayed() -> Self{
        XCTAssert(postsCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkFollowersCountIsDisplayed() -> Self{
        XCTAssert(followersCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkLikesCountIsDisplayed() -> Self{
        XCTAssert(likesCount.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPhoto1IsDisplayed() -> Self{
        XCTAssert(photo1.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPhoto2IsDisplayed() -> Self{
        XCTAssert(photo2.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func checkPhoto3IsDisplayed() -> Self{
        XCTAssert(photo3.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func checkPhoto4IsDisplayed() -> Self{
        XCTAssert(photo4.waitForExistence(timeout: 5))
        return self
    }
}


