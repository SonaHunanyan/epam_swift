//
//  APIServiceTests.swift
//  UnitTesting
//

import XCTest
@testable import UnitTesting

final class APIServiceTests: XCTestCase {
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockURLSession = MockURLSession()
    }
    
    override func tearDown() {
        mockURLSession = nil
        super.tearDown()
    }
    
    // MARK: Fetch Users
    
    // pass some invalid url and assert that method completes with .failure(.invalidUrl)
    // use expectations
    func test_apiService_fetchUsers_whenInvalidUrl_completesWithError() {
        let sut = makeSut()
        let expectation = self.expectation(description: "Expected .failure(.invalidUrl)")
        sut.fetchUsers(urlString: "") { result in
            switch(result){
            case .failure(let error):
                XCTAssertEqual(error, .invalidUrl)
            case .success(_):
                XCTFail("Expected .invalidUrl")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    // assert that method completes with .success(expectedUsers)
    func test_apiService_fetchUsers_whenValidSuccessfulResponse_completesWithSuccess() {
        let response = """
        [
            { "id": 1, "name": "John Doe", "username": "johndoe", "email": "johndoe@gmail.com" },
            { "id": 2, "name": "Jane Doe", "username": "johndoe", "email": "johndoe@gmail.com" }
        ]
        """.data(using: .utf8)
        mockURLSession.mockData = response
        
        let sut = makeSut()
        
        let expectation = self.expectation(description: "Expected Success")
        sut.fetchUsers(urlString: "url") { result in
            switch(result) {
            case .failure(_):
                XCTFail("Expected Success")
            case .success(let data):
                XCTAssertEqual(data.count, 2)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    
    // assert that method completes with .failure(.parsingError)
    func test_apiService_fetchUsers_whenInvalidSuccessfulResponse_completesWithFailure() {
        mockURLSession.mockData = "".data(using: .utf8)
        let sut = makeSut()
        let expectation = self.expectation(description: ".parsingError")
        sut.fetchUsers(urlString: "url") { result in
            switch(result) {
            case .failure(let error):
                XCTAssertEqual(error, .parsingError)
            case .success(_):
                XCTFail("Expected .parsingError")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    // assert that method completes with .failure(.unexpected)
    func test_apiService_fetchUsers_whenError_completesWithFailure() {
        mockURLSession.mockError = NSError(domain: "", code: 404)
        let sut = makeSut()
        let expectation = self.expectation(description: ".unexpected")
        sut.fetchUsers(urlString: "url") { result in
            switch(result) {
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            case .success(_):
                XCTFail("Expected .unexpected")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
    
    // MARK: Fetch Users Async
    
    // pass some invalid url and assert that method completes with .failure(.invalidUrl)
    func test_apiService_fetchUsersAsync_whenInvalidUrl_completesWithError() async {
        let sut = makeSut()
        let result = await sut.fetchUsersAsync(urlString: "")
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .invalidUrl)
        case .success:
            XCTFail("Expected .invalidUrl")
        }
    }
    
    func test_apiService_fetchUsersAsync_whenValidSuccessfulResponse_completesWithSuccess() async {
        let response = """
           [
            { "id": 1, "name": "John Doe", "username": "johndoe", "email": "johndoe@gmail.com" },
            { "id": 2, "name": "Jane Doe", "username": "johndoe", "email": "johndoe@gmail.com" }
           ]
           """.data(using: .utf8)
        mockURLSession.mockData = response
        let sut = makeSut()
        
        let result = await sut.fetchUsersAsync(urlString: "url")
        switch result {
        case .success(let data):
            XCTAssertEqual(data.count, 2)
        case .failure:
            XCTFail("Expected success")
        }
    }
    
    func test_apiService_fetchUsersAsync_whenParsingFails_completesWithError() async {
        mockURLSession.mockData = "".data(using: .utf8)
        let sut = makeSut()

        let result = await sut.fetchUsersAsync(urlString: "url")
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .parsingError)
        case .success:
            XCTFail("Expected .parsingError")
        }
    }
    
    func test_apiService_fetchUsersAsync_whenErrorThrown_completesWithUnexpectedError() async {
        mockURLSession.mockError = NSError(domain: "", code: 404)
        let sut = makeSut()

        let result = await sut.fetchUsersAsync(urlString: "url")
        switch result {
        case .failure(let error):
            XCTAssertEqual(error, .unexpected)
        case .success:
            XCTFail("Expected .unexpected")
        }
    }
    
    private func makeSut() -> APIService {
        APIService(urlSession: mockURLSession)
    }
}
