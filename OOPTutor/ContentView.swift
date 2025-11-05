import SwiftUI

struct ContentView: View {
    @EnvironmentObject var progressTracker: ProgressTracker
    @State private var selectedLesson: Lesson?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Lesson.allLessons) { lesson in
                    NavigationLink(destination: LessonView(lesson: lesson)) {
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(lesson.title)
                                    .font(.headline)
                                Text(lesson.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            if progressTracker.isLessonCompleted(lesson.id) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("OOP Tutor")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("\(progressTracker.completedLessons.count)/\(Lesson.allLessons.count)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProgressTracker())
}
