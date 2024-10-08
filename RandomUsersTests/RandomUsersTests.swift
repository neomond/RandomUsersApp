//
//  RandomUsersTests.swift
//  RandomUsersTests
//
//  Created by Nazrin Atayeva on 25.09.24.
//

import XCTest
@testable import RandomUsers  /// Annotate each test case with the @testable attribute to make your app's classes and functions accessible for testing.

final class RandomUsersTests: XCTestCase {
    
    func testUserModel() throws {
        // Arrange
        let jsonData = getTestJSONData()
        
        do {
            // Act
            _ = try JSONDecoder().decode(Response.self, from: jsonData)
        } catch {
           XCTFail("Failed to decode JSON into the model: \(error)")
        }
        
        // Assert ....
    }
    

    private func getTestJSONData() -> Data {
        guard let path = Bundle.main.path(forResource: "randomUsers", ofType: "json") else {
            fatalError("randomUsers.json file not found")
        }
        let internalURL = URL(fileURLWithPath: path)
        return try! Data(contentsOf: internalURL)
    }

}
