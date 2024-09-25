//
//  ContentView.swift
//  RandomUsers
//
//  Created by Nazrin Atayeva on 23.09.24.
//

import SwiftUI

struct ContentView: View {
    /// Declare userData with the @StateObject modifier since it should update the UI if the users change.
    
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                Text(user.fullName)
            }
            .navigationTitle("Random Users")
        }
    }
}

#Preview {
    ContentView()
}
