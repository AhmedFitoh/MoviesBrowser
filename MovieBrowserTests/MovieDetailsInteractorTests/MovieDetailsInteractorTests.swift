import Foundation
import XCTest

@testable import MovieBrowser

class MovieDetailsInteractorTests: XCTestCase, PresenterToInteractorTestProtocolMock {
    var interactor: MovieDetailsInteractor!
    
    // MARK: - Test Objects
    var presenterMock: MovieDetailsInteractorToPresenterInterfaceMock!
    var fetchExp: XCTestExpectation?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        interactor = MovieDetailsInteractor(webService: WebServiceMock())
        presenterMock = MovieDetailsInteractorToPresenterInterfaceMock(interactor: self)
        interactor.presenter = presenterMock
    }
    
    override func tearDownWithError() throws {
        interactor.presenter = nil
        interactor = nil
        presenterMock = nil
        try super.tearDownWithError()
    }
    
    private func fetchFreshData(){
        fetchExp = expectation(description: "Fetching details")
        interactor.fetchMovieDetails(id: 1)
        waitForExpectations(timeout: 5)
    }
    // MARK: - Operational
    
    func testFetchData(){
        fetchFreshData()
        
        XCTAssertNil(presenterMock?.error, "Shouldn't get error")
        XCTAssertNotNil(presenterMock?.info, "Failed to load data.")
    }
    
    func testBackdropPath(){
        fetchFreshData()
        
        XCTAssertEqual(presenterMock?.info?.backdropPath, "/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg", "Backdrop image should match")
    }
    
    func testVoteAverage(){
        fetchFreshData()
        
        XCTAssertEqual(presenterMock?.info?.voteAverage, 7.9, "Vote average should match")
    }
    
}
