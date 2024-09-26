//
//  UsersView.swift
//  RandomUsers
//
//  Created by Nazrin Atayeva on 23.09.24.
//

import SwiftUI

struct UsersView: View {
    /// Declare userData with the @StateObject modifier since it should update the UI if the users change.
    
    @StateObject var userData = UserData()
    
    var body: some View {
        NavigationView {
            List(userData.users) { user in
                HStack {
                    AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                        image.clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person")
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    Text(user.fullName)
                    
                }
            }
            .navigationTitle("Random Users")
        }
    }
}

#Preview {
    UsersView()
}
