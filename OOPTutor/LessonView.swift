import SwiftUI

struct LessonView: View {
    let lesson: Lesson
    @EnvironmentObject var progressTracker: ProgressTracker
    @State private var showQuiz = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Lesson Content
                VStack(alignment: .leading, spacing: 12) {
                    Text("About")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(lesson.content)
                        .font(.body)
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Code Example
                VStack(alignment: .leading, spacing: 12) {
                    Text("Code Example")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        Text(lesson.codeExample)
                            .font(.system(.body, design: .monospaced))
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Key Points
                VStack(alignment: .leading, spacing: 12) {
                    Text("Key Points")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ForEach(lesson.keyPoints, id: \.self) { point in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.body)
                            Text(point)
                                .font(.body)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Take Quiz Button
                Button(action: {
                    showQuiz = true
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                        Text("Take Quiz")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding(.top, 8)
                
                // Completion Status
                if progressTracker.isLessonCompleted(lesson.id) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Text("Lesson Completed!")
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle(lesson.title)
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showQuiz) {
            QuizView(quiz: lesson.quiz, lessonId: lesson.id)
        }
    }
}

#Preview {
    NavigationView {
        LessonView(lesson: Lesson.allLessons[0])
            .environmentObject(ProgressTracker())
    }
}
