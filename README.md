Book Library App

This project is a Flutter application that displays a collection of books and authors, enabling users to view book details, rate books, and manage user authentication. The app is designed with pixel-perfect accuracy based on the provided Figma design and integrates with a REST API.

Features
1. Authentication Screen

    Register with username and password.
    Store the JWT token using SharedPreferences for persistent login.
    Redirect to the Home Screen automatically if the user is already logged in.

2. Home Screen

    Displays a list of books with their author information and star ratings.
    Includes a search functionality to filter books by title.

3. Book Details Screen

    Shows detailed information about a selected book.
    Users can add a star rating for the book through a bottom sheet interface.
    The app sends the JWT token in the header when posting ratings.

4. Authors Screen

    Displays a list of authors with brief information.

5. Additional Features

    Shimmer Loading  for a better user experience.
    Reusable Widgets for a clean and maintainable codebase.

Technical Requirements

    State Management: BLoC
    Navigation: go_router 
    Persistent Storage: SharedPreferences
    API Integration: Uses the ELT Library System API
    Loading : Shimmer effect
    Clean Architecture: Structured for readability and scalability


Installation

  Clone the repository:

    git clone https://github.com/yourusername/book-library-app.git

 Navigate to the project directory:

    cd book-library-app

 Install dependencies:

    flutter pub get

 Run the app:

    flutter run
