import SwiftUI

struct QuizView: View {
    let quiz: Quiz
    let lessonId: Int
    @EnvironmentObject var progressTracker: ProgressTracker
    @Environment(\.dismiss) var dismiss
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: Int?
    @State private var showExplanation = false
    @State private var score = 0
    @State private var quizCompleted = false
    
    private let passingThreshold = 0.7
    
    var currentQuestion: QuizQuestion {
        quiz.questions[currentQuestionIndex]
    }
    
    var passingScore: Int {
        Int(Double(quiz.questions.count) * passingThreshold)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if !quizCompleted {
                    // Progress Bar
                    ProgressView(value: Double(currentQuestionIndex), total: Double(quiz.questions.count))
                        .padding()
                    
                    Text("Question \(currentQuestionIndex + 1) of \(quiz.questions.count)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    // Question
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            Text(currentQuestion.question)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding()
                            
                            // Answer Options
                            ForEach(Array(currentQuestion.options.enumerated()), id: \.offset) { index, option in
                                Button(action: {
                                    if selectedAnswer == nil {
                                        selectedAnswer = index
                                        showExplanation = true
                                        if index == currentQuestion.correctAnswer {
                                            score += 1
                                        }
                                    }
                                }) {
                                    HStack {
                                        Text(option)
                                            .foregroundColor(.primary)
                                            .multilineTextAlignment(.leading)
                                        Spacer()
                                        if let selected = selectedAnswer {
                                            if index == currentQuestion.correctAnswer {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundColor(.green)
                                            } else if index == selected {
                                                Image(systemName: "xmark.circle.fill")
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(backgroundColor(for: index))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(borderColor(for: index), lineWidth: 2)
                                    )
                                }
                                .disabled(selectedAnswer != nil)
                            }
                            
                            // Explanation
                            if showExplanation {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Explanation")
                                        .font(.headline)
                                    Text(currentQuestion.explanation)
                                        .font(.body)
                                }
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                                .transition(.opacity)
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    // Next Button
                    if selectedAnswer != nil {
                        Button(action: nextQuestion) {
                            Text(currentQuestionIndex < quiz.questions.count - 1 ? "Next Question" : "Finish Quiz")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding()
                        .transition(.move(edge: .bottom))
                    }
                } else {
                    // Quiz Results
                    VStack(spacing: 20) {
                        Spacer()
                        
                        Image(systemName: score >= passingScore ? "star.fill" : "star")
                            .font(.system(size: 80))
                            .foregroundColor(.yellow)
                        
                        Text("Quiz Completed!")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Score: \(score)/\(quiz.questions.count)")
                            .font(.title2)
                        
                        let percentage = (Double(score) / Double(quiz.questions.count)) * 100
                        Text("\(Int(percentage))%")
                            .font(.title3)
                            .foregroundColor(.secondary)
                        
                        if score >= passingScore {
                            Text("Great job! You've mastered this lesson!")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.green)
                                .padding()
                        } else {
                            Text("Keep practicing! Review the lesson and try again.")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.orange)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Done")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Quiz")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    func backgroundColor(for index: Int) -> Color {
        guard let selected = selectedAnswer else {
            return Color(.systemGray6)
        }
        
        if index == currentQuestion.correctAnswer {
            return Color.green.opacity(0.2)
        } else if index == selected {
            return Color.red.opacity(0.2)
        }
        return Color(.systemGray6)
    }
    
    func borderColor(for index: Int) -> Color {
        guard let selected = selectedAnswer else {
            return Color.clear
        }
        
        if index == currentQuestion.correctAnswer {
            return Color.green
        } else if index == selected {
            return Color.red
        }
        return Color.clear
    }
    
    func nextQuestion() {
        withAnimation {
            if currentQuestionIndex < quiz.questions.count - 1 {
                currentQuestionIndex += 1
                selectedAnswer = nil
                showExplanation = false
            } else {
                quizCompleted = true
                if score >= passingScore {
                    progressTracker.completeLesson(lessonId)
                }
            }
        }
    }
}

#Preview {
    QuizView(quiz: Lesson.allLessons[0].quiz, lessonId: 1)
        .environmentObject(ProgressTracker())
}
