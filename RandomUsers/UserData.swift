//
//  UserData.swift
//  RandomUsers
//
//  Created by Nazrin Atayeva on 23.09.24.
//

import Foundation

@MainActor
class UserData: ObservableObject {
    /// Since the userData is declared with the StateObject modifier, let’s update the UserData.users with the Published modifier to update any subscribers with the newly published data. Provided the Published modifier, UserData will need to conform to ObservableObject to update subscribers.
    
   @Published var users: [User] = []
    
    init() {
        Task {
         await loadUsers()
        }
    }
    
    func loadUsers() async {
        do {
            let users = try await UserFetchingClient.getUsers()
            self.users = users
     /// self.users must be set on the main thread. This is because users is an observed object and being published to UsersView.
            
        } catch {
            print(error)
        }
    }
}
