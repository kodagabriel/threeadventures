import Core
import Foundation

protocol ChapterListServicing {
    // template
}

final class ChapterListService {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - ChapterListServicing
extension ChapterListService: ChapterListServicing {
    // template
}
