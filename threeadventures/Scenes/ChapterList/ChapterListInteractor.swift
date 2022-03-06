import Foundation

protocol ChapterListInteracting: AnyObject {
    func doSomething()
}

final class ChapterListInteractor {
    typealias Dependencies = HasNoDependency
    private let dependencies: Dependencies

    private let service: ChapterListServicing
    private let presenter: ChapterListPresenting

    init(service: ChapterListServicing, presenter: ChapterListPresenting, dependencies: Dependencies) {
        self.service = service
        self.presenter = presenter
        self.dependencies = dependencies
    }
}

// MARK: - ChapterListInteracting
extension ChapterListInteractor: ChapterListInteracting {
    func doSomething() {
        presenter.displaySomething()
    }
}
