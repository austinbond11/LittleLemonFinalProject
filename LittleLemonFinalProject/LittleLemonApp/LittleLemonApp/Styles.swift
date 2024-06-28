//
//  LittleLemonButtonStyle.swift
//  LittleLemonApp
//
//  Created by Austin Bond on 28.06.2024.
//

import SwiftUI

// ButtonStyle with yellow background color and wide frame.
struct ButtonStyleYellowColorWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Expand to take up maximum width.
            .frame(maxWidth: .infinity)
            // Change text color depending on button press state.
            .foregroundColor(configuration.isPressed ? .white : .black)
            // Add padding inside the button.
            .padding(10)
            // Change background color depending on button press state.
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            // Rounded corners with radius of 8 points.
            .cornerRadius(8)
            // Add horizontal padding to keep space from other views.
            .padding(.horizontal)
    }
}

// ButtonStyle with primary color theme and custom overlay.
struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Change text color depending on button press state.
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            // Add padding inside the button.
            .padding(10)
            // Change background color depending on button press state.
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            // Rounded corners with radius of 8 points.
            .cornerRadius(8)
            // Overlay to add a stroke around the button.
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            // Add horizontal padding to keep space from other views.
            .padding(.horizontal)
    }
}

// ButtonStyle that reverses primary color themes between text and background.
struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Change text color depending on button press state.
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            // Add padding inside the button.
            .padding(10)
            // Change background color depending on button press state.
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            // Rounded corners with radius of 8 points.
            .cornerRadius(8)
            // Overlay to add a stroke around the button.
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            // Add horizontal padding to keep space from other views.
            .padding(.horizontal)
    }
}

// A toggle button style using primary colors and custom appearance on press.
struct ButtonToggleStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Change text color depending on button press state.
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            // Add padding inside the button.
            .padding(10)
            // Change background color depending on button press state.
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            // Rounded corners with radius of 8 points.
            .cornerRadius(8)
            // Overlay to add a stroke around the button.
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            // Add horizontal padding to keep space from other views.
            .padding(.horizontal)
    }
}

// Custom toggle style for a toggle button with highlight color on active state.
struct MyToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            // Toggle the isOn state when the button is pressed.
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        // Set the text color for the toggle button.
        .foregroundColor(Color.primaryColor1)
        // Add padding inside the button.
        .padding(5)
        // Set the background color conditionally based on the toggle state.
        .background {
            if configuration.isOn {
                Color.highlightColor1
            }
        }
        // Rounded corners with a radius of 8 points.
        .cornerRadius(8)
    }
}

// Text extension to apply a consistent styling for onboarding text.
extension Text {
    func onboardingTextStyle() -> some View {
        self
            // Make the text take up maximum width and align to the leading edge.
            .frame(maxWidth: .infinity, alignment: .leading)
            // Set the foreground color for the text.
            .foregroundColor(Color.primaryColor1)
            // Apply a custom font.
            .font(.custom("Karla-Bold", size: 13))
    }
}

// Font extension to provide custom fonts used in the app.
extension Font {
    // Display font with custom settings.
    static func displayFont() -> Font {
        return Font.custom("Markazi Text", size: 42).weight(.medium)
    }
    
    // Subtitle font with custom settings.
    static func subTitleFont() -> Font {
        return Font.custom("Markazi Text", size: 32)
    }
    
    // Lead text font with custom settings.
    static func leadText() -> Font {
        return Font.custom("Karla", size: 16).weight(.medium)
    }
    
    // Regular text font with custom settings.
    static func regularText() -> Font {
        return Font.custom("Markazi Text", size: 18)
    }
    
    // Section title font with custom settings.
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18).weight(.black)
    }
    
    // Section categories font with custom settings.
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 16).weight(.heavy)
    }
    
    // Paragraph text font with custom settings.
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 14)
    }
    
    // Highlight text font with custom settings.
    static func highlightText() -> Font {
        return Font.custom("Karla", size: 14).weight(.medium)
    }
}

// Color extension to provide custom colors used in the app.
extension Color {
    // Primary color 1.
    static let primaryColor1 = Color(#colorLiteral(red: 0.2862745225, green: 0.3686274588, blue: 0.3411764801, alpha: 1))
    // Primary color 2.
    static let primaryColor2 = Color(#colorLiteral(red: 0.9568627477, green: 0.8078432088, blue: 0.07843137532, alpha: 1))
    
    // Secondary color 1.
    static let secondaryColor1 = Color(#colorLiteral(red: 0.989240706, green: 0.5802358389, blue: 0.4141188264, alpha: 1))
    // Secondary color 2.
    static let secondaryColor2 = Color(#colorLiteral(red: 1, green: 0.8488721251, blue: 0.7164030075, alpha: 1))
    
    // Highlight color 1.
    static let highlightColor1 = Color(#colorLiteral(red: 0.9276351333, green: 0.9375831485, blue: 0.9331009984, alpha: 1))
    // Highlight color 2.
    static let highlightColor2 = Color(#colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1))
}
