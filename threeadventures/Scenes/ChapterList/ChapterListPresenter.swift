import Foundation

protocol ChapterListPresenting: AnyObject {
    func displaySomething()
    func didNextStep(action: ChapterListAction)
}

final class ChapterListPresenter {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let coordinator: ChapterListCoordinating
    weak var viewController: ChapterListDisplaying?

    init(coordinator: ChapterListCoordinating, dependencies: Dependencies) {
        self.coordinator = coordinator
        self.dependencies = dependencies
    }
}

// MARK: - ChapterListPresenting
extension ChapterListPresenter: ChapterListPresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }
    
    func didNextStep(action: ChapterListAction) {
        coordinator.perform(action: action)
    }
}
