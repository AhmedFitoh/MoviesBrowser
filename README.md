# Movie Listing App

This is a movie listing app built using VIPER architecture in Swift. The app fetches movie data from IMDb and displays a list of movies. Users can select a movie to view its details.

## Features

- Fetches movie data from IMDb API.
- Displays a list of movies.
- Allows users to select a movie to view its details.
- Shows movie details such as poster, title and release year.

## Architecture

The app follows the VIPER (View, Interactor, Presenter, Entity, Router) architecture pattern. Here's a brief overview of each component:

- **View**: Responsible for displaying the user interface and receiving user input. It communicates with the presenter to update the UI and respond to user actions.
- **Interactor**: Contains the business logic of the app. It communicates with the presenter to provide data fetched from the IMDb API.
- **Presenter**: Acts as a middleman between the view and the interactor. It receives data from the interactor and formats it for display in the view. It also handles user actions from the view and communicates them to the interactor.
- **Entity**: Represents the data models used in the app. It defines the structure of the movie objects fetched from the IMDb API.
- **Router**: Handles navigation between different screens of the app. It determines which view to present and how to pass data between them.

## Installation

To run the app locally, follow these steps:

1. Clone the repository to your local machine.
2. Open the project in Xcode.
3. Build and run the project on a simulator or your physical iOS device.

## Configuration

Before running the app, you need to provide your IMDb API key. Follow these steps to configure the API key:

1. Open the project in Xcode.
2. Locate the `Constants.swift` file in the `Assets` folder.
3. Replace the value of `readAccessToken` with your IMDb API key.

## Future Enhancements

Here are some potential enhancements that can be made to the app:

- Implementing search functionality to allow users to search for specific movies.
- Adding pagination to load movies in batches and improve performance for larger datasets.
- Integrating user authentication and allowing users to create accounts, rate movies, and save favorites.
- Enhancing the movie details screen by adding trailers, cast information, and reviews.
- Implementing offline mode to cache movie data and allow users to browse movies without an internet connection.

## Contributing

If you would like to contribute to this project, you can follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with descriptive commit messages.
4. Push your changes to your fork.
5. Create a pull request to the original repository.

Please ensure that your code follows the existing code style and conventions. Also, consider writing tests for any new features or bug fixes.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify the code as per your requirements.

---

Thank you for using the Movie Listing App!