# LittleLemonFinalProject

Welcome to **Little Lemon Final Project**. This repository is part of the final project for the Meta iOS Development Certificate. The project demonstrates the implementation of a fictional restaurant application called **Little Lemon**. It includes features such as user onboarding, profile management, menu browsing, and more.

## Features

-  **User Onboarding**: Collects user information during app setup.
-  **Profile Management**: Allows users to update their personal information and preferences.
-  **Menu Browsing**: Displays a list of food items categorized by type.
-  **Detail View**: Provides detailed information about each food item.

## Requirements

-  iOS 16.0+
-  Xcode 14.0+
-  Swift 5.6+

## Installation

1. Clone the repository to your local machine:
   ```sh
   git clone https://github.com/austinbond11/LittleLemonFinalProject.git
   ```
2. Open the project in Xcode:
   ```sh
   cd LittleLemonFinalProject
   open LittleLemonFinalProject.xcodeproj
   ```
3. Build and run the project on your preferred iOS simulator or device.

## Project Structure

```plaintext
LittleLemonFinalProject/
├── LittleLemonApp/
│   ├── Models/
│   │   ├── MenuItem.swift
│   │   ├── MenuList.swift
│   ├── Views/
│   │   ├── Onboarding.swift
│   │   ├── UserProfile.swift
│   │   ├── Menu.swift
│   │   ├── MainScreen.swift
│   │   ├── DetailItem.swift
│   │   ├── FoodItem.swift
│   │   ├── Header.swift
│   │   └── Hero.swift
│   ├── ViewModels/
│   │   ├── ViewModel.swift
│   ├── Util/
│   │   ├── PersistenceController.swift
│   └── LittleLemonApp.swift
├── LittleLemonAppTests/
├── LittleLemonAppUITests/
└── README.md
```

## Key Components

### Models

-  **MenuItem**: Represents a food item on the menu.
-  **MenuList**: Decodes the list of menu items from JSON.

### Views

-  **Onboarding**: Collects user information during the initial setup.
-  **UserProfile**: Allows users to view and update their details.
-  **Menu**: Displays a list of categorized food items.
-  **MainScreen**: Main entry point combining Header and Menu views.
-  **DetailItem**: Detailed view of a selected food item.
-  **FoodItem**: A single food item view used in the menu list.
-  **Header**: Top bar including the app logo and user profile image.
-  **Hero**: Hero section with promotional information about the restaurant.

### ViewModels

-  **ViewModel**: Handles data validation and logic required by views.

### Utility

-  **PersistenceController**: Manages the Core Data stack and operations.

## Usage

### Running the App

To run the app, open it in Xcode and click the run button. This will build the app and launch it in the iOS simulator or your connected device.

### User Onboarding

Upon opening the app, users are presented with the onboarding screen to input their personal information. Once registered, users are taken to the main screen.

### Browsing the Menu

Users can browse through different food categories and view detailed descriptions by selecting an item.

### Updating Profile

Users can update their profile information and preferences by navigating to the profile screen.

## Contributing

If you wish to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch:
   ```sh
   git checkout -b feature/YourFeatureName
   ```
3. Commit your changes:
   ```sh
   git commit -m 'Add some feature'
   ```
4. Push to the branch:
   ```sh
   git push origin feature/YourFeatureName
   ```
5. Open a pull request.


## Contact

For any inquiries or issues, please open an issue on [GitHub](https://github.com/austinbond11/LittleLemonFinalProject).

---

This README provides an overview of the **Little Lemon Final Project**, its features, structure, and instructions on how to set up and run the project. Enjoy exploring the Little Lemon restaurant app! 🍋
