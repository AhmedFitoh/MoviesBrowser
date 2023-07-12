@testable import MovieBrowser

class MoviesListInteractorToPresenterInterfaceMock {
    var functionsCalled = [String]()
    
    // MARK: - Input Variables
    var info: MoviesListModel?
    var error: Error?
    weak var interactor: PresenterToInteractorTestProtocolMock?
    
    init(interactor: PresenterToInteractorTestProtocolMock) {
        self.interactor = interactor
    }
}

extension MoviesListInteractorToPresenterInterfaceMock: MoviesListInteractorToPresenterProtocol {
   
    func fetchTrendingMoviesSuccess(model: MoviesListModel) {
        functionsCalled.append(#function)
        info = model
        interactor?.fetchExp?.fulfill()
    }
    
    func fetchTrendingMoviesError(error: Error?) {
        functionsCalled.append(#function)
        self.error = error
        interactor?.fetchExp?.fulfill()
    }
}
