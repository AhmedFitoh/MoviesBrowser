//
//  Protocols.swift
//  MoviesAppTests
//
//  Created by AhmedFitoh on 7/12/23.
//

import XCTest

protocol PresenterToInteractorTestProtocolMock: AnyObject {
    var fetchExp: XCTestExpectation? {get}
}
