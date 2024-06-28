//
//  Onboarding.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// The Onboarding view where users can register by providing their information.
struct Onboarding: View {
    // View model to handle validation and error messages.
    @StateObject private var viewModel = ViewModel()
    
    // State variables to hold user input.
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    // State variables to handle keyboard visibility and content offset.
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    // State variable to track login status.
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Displaying the header and hero sections.
                    Header()
                    Hero()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    
                    VStack {
                        // Navigation link to Home view, activated based on login status.
                        NavigationLink(destination: Home(), isActive: $isLoggedIn) { }
                        
                        Group {
                            // Text fields for user input.
                            Text("First name *")
                                .onboardingTextStyle()
                            TextField("First Name", text: $firstName)
                            Text("Last name *")
                                .onboardingTextStyle()
                            TextField("Last Name", text: $lastName)
                            Text("E-mail *")
                                .onboardingTextStyle()
                            TextField("E-mail", text: $email)
                                .keyboardType(.emailAddress)
                        }
                        .textFieldStyle(.roundedBorder)
                        .disableAutocorrection(true)
                        .padding()
                    }
                    
                    // Displaying error message, if any.
                    if viewModel.errorMessageShow {
                        withAnimation() {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                    }
                    
                    // Register button handling user input validation and registration actions.
                    Button("Register") {
                        if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            saveUserData()
                            clearInputFields()
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                    
                    Spacer()
                }
                // Offset adjustment for keyboard visibility.
                .offset(y: contentOffset.height)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    handleKeyboardShow(notification: notification)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                    handleKeyboardHide(notification: notification)
                }
            }
            // Check login status when the view appears.
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
        // Hides the back button in the navigation bar.
        .navigationBarBackButtonHidden()
    }
    
    // Save user data to UserDefaults.
    private func saveUserData() {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        UserDefaults.standard.set(true, forKey: kOrderStatuses)
        UserDefaults.standard.set(true, forKey: kPasswordChanges)
        UserDefaults.standard.set(true, forKey: kSpecialOffers)
        UserDefaults.standard.set(true, forKey: kNewsletter)
    }
    
    // Clear input fields after registration.
    private func clearInputFields() {
        firstName = ""
        lastName = ""
        email = ""
    }
    
    // Handle keyboard visibility adjustments.
    private func handleKeyboardShow(notification: Notification) {
        withAnimation {
            if let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                let keyboardHeight = keyboardRect.height
                self.isKeyboardVisible = true
                self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
            }
        }
    }
    
    // Reset content offset when keyboard is hidden.
    private func handleKeyboardHide(notification: Notification) {
        withAnimation {
            self.isKeyboardVisible = false
            self.contentOffset = .zero
        }
    }
}

// Preview provider for SwiftUI preview canvas.
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
