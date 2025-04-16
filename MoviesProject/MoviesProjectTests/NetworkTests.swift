//
//  NetworkTests.swift
//  MoviesProjectTests
//
//  Created by Ivan Velkov on 16.4.25.
//

import XCTest
@testable import MoviesProject

final class URLSessionClientTests: XCTestCase {

    var mockSession: MockNetworkSession!
    var client: URLSessionClient!

    override func setUp() {
        super.setUp()
        mockSession = MockNetworkSession()
        client = URLSessionClient(
            baseURL: "https://example.com/test",
            decoder: JSONDecoder(),
            accessToken: "test_token",
            session: mockSession
        )
    }

    func testSuccessfulDataRequest() async throws {
        struct MockModel: Codable, Equatable {
            let id: Int
            let name: String
        }

        let expected = MockModel(id: 1, name: "Test")
        mockSession.mockData = try JSONEncoder().encode(expected)
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com/test")!, statusCode: 202, httpVersion: nil, headerFields: nil)

        let result: MockModel = try await client.dataRequest("/test", method: .get)
        XCTAssertEqual(result, expected)
    }

    func testBadStatusCodeThrowsError() async throws {
        mockSession.mockData = "{}".data(using: .utf8)
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com/test")!, statusCode: 404, httpVersion: nil, headerFields: nil)

        do {
            let _: [String: String] = try await client.dataRequest("/test", method: .get)
            XCTFail("Expected NetworkError.badStatusCode to be thrown")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .badStatusCode)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testDecodingErrorThrowsError() async throws {
        struct MockModel: Codable {
            let id: Int
        }

        mockSession.mockData = "invalid".data(using: .utf8)
        mockSession.mockResponse = HTTPURLResponse(url: URL(string: "https://example.com/test")!, statusCode: 200, httpVersion: nil, headerFields: nil)

        do {
            let _: MockModel = try await client.dataRequest("/test", method: .get)
            XCTFail("Expected NetworkError.decoding to be thrown")
        } catch let error as NetworkError {
            XCTAssertEqual(error, .decoding)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}

class MockNetworkSession: NetworkSession {
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        }
        return (mockData ?? Data(), mockResponse ?? HTTPURLResponse())
    }
}
