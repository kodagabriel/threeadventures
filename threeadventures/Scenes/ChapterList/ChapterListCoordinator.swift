import UIKit

enum ChapterListAction {
    // template
}

protocol ChapterListCoordinating: AnyObject {
    func perform(action: ChapterListAction)
}

final class ChapterListCoordinator {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    weak var viewController: UIViewController?

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - ChapterListCoordinating
extension ChapterListCoordinator: ChapterListCoordinating {
    func perform(action: ChapterListAction) {
        // template
    }
}
