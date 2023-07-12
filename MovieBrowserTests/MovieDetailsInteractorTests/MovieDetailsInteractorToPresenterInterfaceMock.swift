@testable import MovieBrowser

class MovieDetailsInteractorToPresenterInterfaceMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
    var info: MovieDetailsModel?
    var error: Error?
    weak var interactor: PresenterToInteractorTestProtocolMock?
    
    init(interactor: PresenterToInteractorTestProtocolMock) {
        self.interactor = interactor
    }
}


extension MovieDetailsInteractorToPresenterInterfaceMock: MovieDetailsInteractorToPresenterProtocol {
    
    func fetchMovieDetailsSuccess(model: MovieDetailsModel) {
        functionsCalled.append(#function)
        info = model
        interactor?.fetchExp?.fulfill()
    }
    
    func fetchMovieDetailsFailure(error: Error?) {
        functionsCalled.append(#function)
        self.error = error
        interactor?.fetchExp?.fulfill()
    }
    
}
