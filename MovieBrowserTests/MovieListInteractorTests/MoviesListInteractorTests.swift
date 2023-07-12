import Foundation
import XCTest

@testable import MovieBrowser


class MoviesListInteractorTests: XCTestCase, PresenterToInteractorTestProtocolMock {
    
    var interactor: MoviesListInteractor!
    
    // MARK: - Test Objects
    var presenterMock: MoviesListInteractorToPresenterInterfaceMock!
    var fetchExp: XCTestExpectation?

    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = MoviesListInteractor(webService: WebServiceMock())
        presenterMock = MoviesListInteractorToPresenterInterfaceMock(interactor: self)
        interactor.presenter = presenterMock
    }
    
    override func tearDownWithError() throws {
        interactor.presenter = nil
        interactor = nil
        presenterMock = nil
        try super.tearDownWithError()
    }
    
    
    private func fetchFreshData(){
        fetchExp = expectation(description: "Fetching items")
        interactor.fetchTrendingMovies(page: 1)
        waitForExpectations(timeout: 5)
    }
    // MARK: - Operational
    
    func testFetchData(){
        fetchFreshData()

        XCTAssertNil(presenterMock?.error, "Shouldn't get error")
        XCTAssertNotNil(presenterMock?.info, "Failed to load data.")
    }
    
    func testNumberOfMovies(){
        fetchFreshData()

        XCTAssertEqual(presenterMock?.info?.results.count, 20, "Should get 20 items, invalid parsing")
    }

}


