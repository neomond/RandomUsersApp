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
            VStack {
                Text("Raw JSON Data:")
                ScrollView {
                    Text(userData.users)
                }
            }
            .padding()
            .navigationTitle("Random Users")
        }
    }
}

#Preview {
    ContentView()
}
