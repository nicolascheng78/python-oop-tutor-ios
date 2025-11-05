import Foundation
import SwiftUI

class ProgressTracker: ObservableObject {
    @Published var completedLessons: Set<Int> = []
    
    private let userDefaultsKey = "completedLessons"
    
    init() {
        loadProgress()
    }
    
    func completeLesson(_ lessonId: Int) {
        completedLessons.insert(lessonId)
        saveProgress()
    }
    
    func isLessonCompleted(_ lessonId: Int) -> Bool {
        return completedLessons.contains(lessonId)
    }
    
    func resetProgress() {
        completedLessons.removeAll()
        saveProgress()
    }
    
    private func saveProgress() {
        let array = Array(completedLessons)
        UserDefaults.standard.set(array, forKey: userDefaultsKey)
    }
    
    private func loadProgress() {
        if let array = UserDefaults.standard.array(forKey: userDefaultsKey) as? [Int] {
            completedLessons = Set(array)
        }
    }
}
