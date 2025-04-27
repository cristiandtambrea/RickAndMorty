import XCTest

final class RickAndMortyUITests: XCTestCase {

    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    @MainActor
    func testEpisodeListAppears() {
        XCTAssertTrue(app.navigationBars["Episodes"].exists)
        let buttonS01E01 = app.buttons["S01E01"]
        XCTAssertTrue(buttonS01E01.waitForExistence(timeout: 5), "Expected at least one episode to load")
    }

    @MainActor
    func testEpisodeTapNavigatesToEpisodeDetail() {
        let buttonS01E01 = app.buttons["S01E01"]
        XCTAssertTrue(buttonS01E01.waitForExistence(timeout: 5))
        buttonS01E01.tap()
        let detailTitle = app.staticTexts["S01E01"]
        XCTAssertTrue(detailTitle.waitForExistence(timeout: 2), "Tapping an episode should show its detail screen")
    }
}
