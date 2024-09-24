//
//  UserFetchingClient.swift
//  RandomUsers
//
//  Created by Nazrin Atayeva on 23.09.24.
//

import Foundation


struct UserFetchingClient {
    static private let url = URL(string: "https://randomuser.me/api/?results=10&format=pretty")!
    
    /// Declare this function static as it does not need to belong to a specific instance of UserFetchingClient.
    /// Swift provides a URLSession.shared.data(from: URL) function to request data from a specified URL. The function returns two value types: Data and URLResponse. The URLResponse will contain associated metadata, and the Data will contain any data in the response. In this project, you will only use the Data value.
    /// Since the function returns two values, define a tuple (data, _) to store the data. The second property is an _ because you don’t need to use the URLResponse here.
    /// By default, URLSession operations occur on a background thread
    ///
    /// The getUsers() function is declared as a throwing, asynchronous function because it executes asynchronous operations and may have errors in those operations.
    /// The call to get random user data is made asynchronously using the async keyword, then accessed using the await keyword to ensure that data is present before continuing.
    
    
    static func getUsers() async throws -> String {
        async let (data, _) = URLSession.shared.data(from: url)
        return try await String(data: data, encoding: .utf8)!
    }
}
