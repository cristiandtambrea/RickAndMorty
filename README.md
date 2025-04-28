# Rick and Morty SwiftUI App

A small SwiftUI app built to explore new Swift features and best practices, using the [Rick and Morty REST API](https://rickandmortyapi.com/documentation/#rest) as a playground.

---

## Features

- **MVVM + Coordinator:**  
  MVVM pattern with a simple coordinator setup to manage navigation without cluttering the views.

- **State Management with `@Observable`:**  
  State and data flow are handled using Swift 5.9’s new `@Observable` macro.

- **Networking with async/await:**  
  API calls are made using async/await, returning a Result type instead of throwing errors, keeping a more functional flow and preserving typed errors.

- **Code Organization:**  
  Features are separated into modules like Character and Episode, aiming for a scalable and easy-to-understand project structure.

- **Unit Testing:**  
  Some basic tests are written using the new Swift Testing APIs to validate networking behaviour and UI flow.

- **Basic Persistence(WIP):**  
  A simple persistence layer allows saving some episode data locally using a `PersistenceViewModel`.

---

## Project Structure

RickAndMorty/
├── Common/              # Formatters, View Modifiers, Reusable Views
├── Feature/             # Feature modules (Character, Episode, ...)
├── Navigation/          # Coordinator pattern and app navigation
├── Network/             # Networking layer and API models
├── Persistence/         # Basic local data persistence
├── Assets/              # App icons and assets
├── App Files            # Entry point and app lifecycle
RickAndMortyTests/       # Unit tests
RickAndMortyUITests/     # UI tests

---

##Notes

This project is meant for experimentation and learning. It may not cover all edge cases and is definitely not production-ready.

Feel free to contribute. Happy coding! 🙂
