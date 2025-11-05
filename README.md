# OOP Tutor - iOS App for Learning Object-Oriented Programming

An interactive iOS application designed to help users learn Object-Oriented Programming (OOP) concepts through lessons, code examples, and quizzes.

## Features

### 📚 Comprehensive Lessons
- **Introduction to Classes**: Understanding the basics of classes and how to create them
- **Objects and Instances**: Creating and using objects from classes
- **Inheritance**: Building on existing classes to create new functionality
- **Encapsulation**: Protecting and organizing data within classes
- **Polymorphism**: One interface, many forms - flexible and extensible code
- **Abstraction**: Hiding complexity and showing only essential features

### ✨ Interactive Learning
- **Code Examples**: Real Python code examples for each concept
- **Key Points**: Summary of important takeaways from each lesson
- **Interactive Quizzes**: Test your knowledge with multiple-choice questions
- **Immediate Feedback**: Get explanations for correct and incorrect answers

### 📊 Progress Tracking
- Track completed lessons with checkmarks
- See your overall progress at a glance
- Quiz score tracking with 70% passing threshold
- Progress persists between app sessions

## Requirements

- iOS 17.0 or later
- Xcode 15.0 or later
- Swift 5.0 or later

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/nicolascheng78/python-oop-tutor-ios.git
   cd python-oop-tutor-ios
   ```

2. Open the project in Xcode:
   ```bash
   open OOPTutor.xcodeproj
   ```

3. Select your target device or simulator

4. Build and run the project (⌘R)

## Project Structure

```
OOPTutor/
├── OOPTutorApp.swift       # Main app entry point
├── ContentView.swift       # Home screen with lesson list
├── LessonView.swift        # Detailed lesson view
├── QuizView.swift          # Interactive quiz interface
├── LessonModel.swift       # Data models for lessons and quizzes
├── ProgressTracker.swift   # Progress tracking and persistence
└── Assets.xcassets/        # App icons and colors
```

## How to Use

1. **Browse Lessons**: Open the app to see a list of all available OOP lessons
2. **Study Content**: Tap on any lesson to read the explanation and code examples
3. **Review Key Points**: Check the key takeaways for each concept
4. **Take Quizzes**: Test your understanding with interactive quizzes
5. **Track Progress**: Complete quizzes to mark lessons as finished
6. **Learn at Your Pace**: Revisit lessons anytime to reinforce your learning

## Technologies Used

- **SwiftUI**: Modern declarative UI framework
- **Combine**: For reactive programming and state management
- **UserDefaults**: For persistent progress tracking
- **iOS SDK**: Native iOS development

## Learning Objectives

By completing this app, you will understand:
- What classes and objects are
- How to create and use instances
- The concept of inheritance and code reuse
- How encapsulation protects data
- What polymorphism enables in OOP
- How abstraction simplifies complex systems

## Contributing

Contributions are welcome! If you'd like to add more lessons, improve the UI, or fix bugs:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-lesson`)
3. Commit your changes (`git commit -m 'Add new lesson on composition'`)
4. Push to the branch (`git push origin feature/new-lesson`)
5. Open a Pull Request

## Future Enhancements

- [ ] Add Swift code examples alongside Python
- [ ] Include interactive code playgrounds
- [ ] Add more advanced OOP topics
- [ ] Support for multiple programming languages
- [ ] Gamification with achievements and badges
- [ ] Dark mode optimizations
- [ ] iPad-specific layouts

## License

This project is open source and available under the MIT License.

## Acknowledgments

- Designed for learners who want to master OOP concepts
- Python code examples are beginner-friendly and well-commented
- Quiz questions designed to reinforce key learning points

---

Made with ❤️ for aspiring programmers
