import SwiftUI

@main
struct OOPTutorApp: App {
    @StateObject private var progressTracker = ProgressTracker()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(progressTracker)
        }
    }
}
