import Foundation

struct Lesson: Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let content: String
    let codeExample: String
    let keyPoints: [String]
    let quiz: Quiz
}

struct Quiz: Identifiable {
    let id: Int
    let questions: [QuizQuestion]
}

struct QuizQuestion: Identifiable {
    let id: Int
    let question: String
    let options: [String]
    let correctAnswer: Int
    let explanation: String
}

extension Lesson {
    static let allLessons: [Lesson] = [
        Lesson(
            id: 1,
            title: "Introduction to Classes",
            subtitle: "Understanding the basics of classes",
            content: """
            A class is a blueprint for creating objects. It defines the properties and methods that objects of that class will have.
            
            Classes are fundamental to Object-Oriented Programming (OOP). They allow you to:
            • Bundle data and functionality together
            • Create multiple instances with shared behavior
            • Organize code in a logical, reusable way
            
            Think of a class as a cookie cutter and objects as the cookies. The class defines the shape, but each cookie (object) is a separate entity.
            """,
            codeExample: """
            class Dog:
                def __init__(self, name, age):
                    self.name = name
                    self.age = age
                
                def bark(self):
                    return f"{self.name} says Woof!"
            
            # Creating objects
            my_dog = Dog("Buddy", 3)
            print(my_dog.bark())  # Output: Buddy says Woof!
            """,
            keyPoints: [
                "A class is a blueprint for creating objects",
                "Use __init__ to initialize object properties",
                "Objects are instances of classes",
                "Methods define behaviors of objects"
            ],
            quiz: Quiz(id: 1, questions: [
                QuizQuestion(
                    id: 1,
                    question: "What is a class in OOP?",
                    options: [
                        "A function that returns a value",
                        "A blueprint for creating objects",
                        "A type of loop",
                        "A conditional statement"
                    ],
                    correctAnswer: 1,
                    explanation: "A class is a blueprint or template for creating objects. It defines the structure and behavior that objects of that class will have."
                ),
                QuizQuestion(
                    id: 2,
                    question: "What method is used to initialize an object in Python?",
                    options: [
                        "__start__",
                        "__create__",
                        "__init__",
                        "__new__"
                    ],
                    correctAnswer: 2,
                    explanation: "The __init__ method is the constructor in Python, used to initialize the attributes of an object when it's created."
                )
            ])
        ),
        
        Lesson(
            id: 2,
            title: "Objects and Instances",
            subtitle: "Creating and using objects",
            content: """
            Objects are instances of classes. When you create an object, you're creating a specific example of the class with its own data.
            
            Each object has:
            • Its own set of attributes (properties)
            • Access to methods defined in the class
            • A unique identity in memory
            
            You can create multiple objects from the same class, and each will maintain its own state independently.
            """,
            codeExample: """
            class Car:
                def __init__(self, brand, model):
                    self.brand = brand
                    self.model = model
                    self.speed = 0
                
                def accelerate(self, amount):
                    self.speed += amount
            
            # Creating multiple objects
            car1 = Car("Toyota", "Camry")
            car2 = Car("Honda", "Accord")
            
            car1.accelerate(30)
            print(f"{car1.brand} speed: {car1.speed}")  # 30
            print(f"{car2.brand} speed: {car2.speed}")  # 0
            """,
            keyPoints: [
                "Objects are instances of classes",
                "Each object has its own attributes",
                "Multiple objects can exist from one class",
                "Objects maintain independent states"
            ],
            quiz: Quiz(id: 2, questions: [
                QuizQuestion(
                    id: 3,
                    question: "What is an object?",
                    options: [
                        "A blueprint for creating classes",
                        "An instance of a class",
                        "A type of function",
                        "A programming language"
                    ],
                    correctAnswer: 1,
                    explanation: "An object is an instance of a class - a concrete realization of the class blueprint with its own data."
                ),
                QuizQuestion(
                    id: 4,
                    question: "Can multiple objects from the same class have different attribute values?",
                    options: [
                        "No, they share all values",
                        "Yes, each object has its own attributes",
                        "Only if using static methods",
                        "Only in compiled languages"
                    ],
                    correctAnswer: 1,
                    explanation: "Each object maintains its own set of attributes, so objects from the same class can have different values."
                )
            ])
        ),
        
        Lesson(
            id: 3,
            title: "Inheritance",
            subtitle: "Building on existing classes",
            content: """
            Inheritance allows a class to inherit properties and methods from another class. This promotes code reuse and establishes relationships between classes.
            
            Key concepts:
            • Parent/Base class: The class being inherited from
            • Child/Derived class: The class that inherits
            • The child class gets all parent methods and attributes
            • Child classes can override parent methods
            • Use 'super()' to call parent methods
            
            This creates an "is-a" relationship (e.g., a Dog is-a Animal).
            """,
            codeExample: """
            class Animal:
                def __init__(self, name):
                    self.name = name
                
                def speak(self):
                    return "Some sound"
            
            class Dog(Animal):
                def speak(self):
                    return f"{self.name} barks!"
            
            class Cat(Animal):
                def speak(self):
                    return f"{self.name} meows!"
            
            dog = Dog("Rex")
            cat = Cat("Whiskers")
            print(dog.speak())  # Rex barks!
            print(cat.speak())  # Whiskers meows!
            """,
            keyPoints: [
                "Inheritance promotes code reuse",
                "Child classes inherit parent attributes and methods",
                "Use super() to access parent class methods",
                "Child classes can override parent methods"
            ],
            quiz: Quiz(id: 3, questions: [
                QuizQuestion(
                    id: 5,
                    question: "What is inheritance in OOP?",
                    options: [
                        "A way to hide data",
                        "A mechanism to inherit properties from another class",
                        "A method to delete objects",
                        "A type of loop"
                    ],
                    correctAnswer: 1,
                    explanation: "Inheritance is a mechanism that allows a class to inherit properties and methods from another class, promoting code reuse."
                ),
                QuizQuestion(
                    id: 6,
                    question: "What keyword is used to call a parent class method in Python?",
                    options: [
                        "parent()",
                        "base()",
                        "super()",
                        "inherit()"
                    ],
                    correctAnswer: 2,
                    explanation: "The super() function is used in Python to call methods from the parent class."
                )
            ])
        ),
        
        Lesson(
            id: 4,
            title: "Encapsulation",
            subtitle: "Protecting and organizing data",
            content: """
            Encapsulation is the bundling of data and methods that operate on that data within a single unit (class). It also involves restricting direct access to some components.
            
            Benefits:
            • Data hiding: Internal details are hidden from outside
            • Better control: You can validate data before setting it
            • Flexibility: Internal implementation can change without affecting users
            • Modularity: Code is organized into self-contained units
            
            In Python, we use naming conventions:
            • _single_underscore: "protected" (convention only)
            • __double_underscore: "private" (name mangling)
            """,
            codeExample: """
            class BankAccount:
                def __init__(self, owner, balance=0):
                    self.owner = owner
                    self.__balance = balance  # Private attribute
                
                def deposit(self, amount):
                    if amount > 0:
                        self.__balance += amount
                        return True
                    return False
                
                def get_balance(self):
                    return self.__balance
                
                def withdraw(self, amount):
                    if 0 < amount <= self.__balance:
                        self.__balance -= amount
                        return True
                    return False
            
            account = BankAccount("Alice", 1000)
            account.deposit(500)
            print(account.get_balance())  # 1500
            # account.__balance would cause an error
            """,
            keyPoints: [
                "Encapsulation bundles data and methods together",
                "Use private attributes to hide internal data",
                "Provide public methods to interact with data",
                "Enables data validation and protection"
            ],
            quiz: Quiz(id: 4, questions: [
                QuizQuestion(
                    id: 7,
                    question: "What is encapsulation?",
                    options: [
                        "Creating multiple classes",
                        "Bundling data and methods while restricting access",
                        "Inheriting from parent classes",
                        "Overriding methods"
                    ],
                    correctAnswer: 1,
                    explanation: "Encapsulation is the bundling of data and methods into a single unit while restricting direct access to some components."
                ),
                QuizQuestion(
                    id: 8,
                    question: "In Python, how do you indicate a private attribute?",
                    options: [
                        "private_attribute",
                        "_attribute",
                        "__attribute",
                        "attribute_"
                    ],
                    correctAnswer: 2,
                    explanation: "In Python, prefixing an attribute name with double underscores (__) makes it private through name mangling."
                )
            ])
        ),
        
        Lesson(
            id: 5,
            title: "Polymorphism",
            subtitle: "One interface, many forms",
            content: """
            Polymorphism means "many forms". It allows objects of different classes to be treated as objects of a common parent class. The same method name can behave differently based on the object calling it.
            
            Types of polymorphism:
            • Method Overriding: Child class provides its own implementation
            • Duck Typing: "If it walks like a duck and quacks like a duck, it's a duck"
            • Operator Overloading: Same operator works differently on different types
            
            Polymorphism enables flexible and extensible code by allowing you to write code that works with the parent class but can handle any child class.
            """,
            codeExample: """
            class Shape:
                def area(self):
                    pass
            
            class Rectangle(Shape):
                def __init__(self, width, height):
                    self.width = width
                    self.height = height
                
                def area(self):
                    return self.width * self.height
            
            class Circle(Shape):
                def __init__(self, radius):
                    self.radius = radius
                
                def area(self):
                    return 3.14159 * self.radius ** 2
            
            # Polymorphism in action
            shapes = [Rectangle(5, 4), Circle(3)]
            for shape in shapes:
                print(f"Area: {shape.area()}")
            """,
            keyPoints: [
                "Polymorphism means 'many forms'",
                "Same method name, different implementations",
                "Enables flexible and extensible code",
                "Works through inheritance and method overriding"
            ],
            quiz: Quiz(id: 5, questions: [
                QuizQuestion(
                    id: 9,
                    question: "What is polymorphism?",
                    options: [
                        "Creating private methods",
                        "The ability to take many forms",
                        "Hiding implementation details",
                        "Creating multiple constructors"
                    ],
                    correctAnswer: 1,
                    explanation: "Polymorphism is the ability of objects to take many forms - the same interface can be used for different underlying data types."
                ),
                QuizQuestion(
                    id: 10,
                    question: "Which of these demonstrates polymorphism?",
                    options: [
                        "Creating a new class",
                        "Using private attributes",
                        "Different classes with the same method name behaving differently",
                        "Initializing objects"
                    ],
                    correctAnswer: 2,
                    explanation: "Polymorphism is demonstrated when different classes implement the same method name but with different behaviors."
                )
            ])
        ),
        
        Lesson(
            id: 6,
            title: "Abstraction",
            subtitle: "Hiding complexity",
            content: """
            Abstraction means hiding complex implementation details and showing only the essential features. It focuses on what an object does rather than how it does it.
            
            Key concepts:
            • Abstract classes: Cannot be instantiated, serve as templates
            • Abstract methods: Must be implemented by child classes
            • Interfaces: Define contracts that classes must follow
            • Simplification: Users interact with simple interfaces
            
            Think of driving a car - you use the steering wheel and pedals (abstract interface) without knowing the engine details (hidden complexity).
            """,
            codeExample: """
            from abc import ABC, abstractmethod
            
            class PaymentMethod(ABC):
                @abstractmethod
                def process_payment(self, amount):
                    pass
            
            class CreditCard(PaymentMethod):
                def process_payment(self, amount):
                    return f"Processing ${amount} via Credit Card"
            
            class PayPal(PaymentMethod):
                def process_payment(self, amount):
                    return f"Processing ${amount} via PayPal"
            
            # Cannot instantiate abstract class
            # payment = PaymentMethod()  # Error!
            
            cc = CreditCard()
            pp = PayPal()
            print(cc.process_payment(100))
            print(pp.process_payment(50))
            """,
            keyPoints: [
                "Abstraction hides implementation details",
                "Focus on what an object does, not how",
                "Abstract classes define templates",
                "Child classes implement abstract methods"
            ],
            quiz: Quiz(id: 6, questions: [
                QuizQuestion(
                    id: 11,
                    question: "What is abstraction in OOP?",
                    options: [
                        "Creating multiple objects",
                        "Hiding implementation details and showing only essential features",
                        "Inheriting from multiple classes",
                        "Making all methods private"
                    ],
                    correctAnswer: 1,
                    explanation: "Abstraction is the concept of hiding implementation details and exposing only the essential features to the user."
                ),
                QuizQuestion(
                    id: 12,
                    question: "Can you instantiate an abstract class?",
                    options: [
                        "Yes, always",
                        "No, never",
                        "Only if it has no methods",
                        "Only in Python 2"
                    ],
                    correctAnswer: 1,
                    explanation: "Abstract classes cannot be instantiated - they serve as templates that must be inherited and implemented by concrete classes."
                )
            ])
        )
    ]
}
