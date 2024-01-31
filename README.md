# Flutter GitHub Issues Viewer

## Overview

The Flutter GitHub Issues Viewer is a mobile app that displays a list of issues raised in the Flutter repository. It leverages the GitHub public API to fetch data and offers various features to enhance the user experience.

## Features

- Display of issue details including title, beginning of issue text, author's username, creation date, and issue labels.
- Endless scroll pagination for efficient loading of issues.
- Filter issues by labels available in the repository.
- Loading indicator during data retrieval.
- Error message presentation in case of data loading failure.

## GitHub API

The app utilizes the following GitHub APIs:

- [List Repository Issues](https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues)
- [List Labels for a Repository](https://docs.github.com/en/rest/issues/labels?apiVersion=2022-11-28#list-labels-for-a-repository)

## Dependencies

| Package            | Version   | Reason                                           |
|--------------------|-----------|--------------------------------------------------|
| flutter_riverpod   | ^2.4.9     | State management for Flutter.                    |
| http               | ^1.2.0     | HTTP client for making requests to the GitHub API.|
| intl               | ^0.19.0    | Internationalization support for date formatting.|
| riverpod_annotation| ^2.3.3     | Code generation for Riverpod.                    |
| search_choices     | ^2.2.7     | Dropdown selection for issue label filtering.    |

## Getting Started

To run the app locally, follow these steps:

1. Clone the repository.
2. Install dependencies using `flutter pub get`.
3. Run the app using `flutter run`.

## License

This project is licensed under the [MIT License](LICENSE).

