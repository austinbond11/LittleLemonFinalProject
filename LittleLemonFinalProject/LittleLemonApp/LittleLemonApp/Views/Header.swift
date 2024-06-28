//
//  HeaderBar.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The Header view represents the top bar of the app, which displays a logo and a profile button if the user is logged in.
struct Header: View {
    // State variable to track if the user is logged in.
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    // Display the app logo centered.
                    Image("logo")
                    
                    // HStack to align the profile image in the top right corner.
                    HStack {
                        Spacer()
                        if isLoggedIn {
                            // If logged in, display the profile image with navigation to UserProfile.
                            NavigationLink(destination: UserProfile()) {
                                Image("profile-image-placeholder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 60)  // Set the height of the header.
        .padding(.bottom)  // Add bottom padding for spacing consistency.
        .onAppear {
            // Check user login status when the view appears.
            isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
        }
    }
}

// Preview provider for the SwiftUI preview canvas.
struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
