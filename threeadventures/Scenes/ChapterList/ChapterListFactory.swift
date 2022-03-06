import UIKit

enum ChapterListFactory {
    static func make() -> UIViewController {
        let container = DependencyContainer()
        let service = ChapterListService(dependencies: container)
        let coordinator = ChapterListCoordinator(dependencies: container)
        let presenter = ChapterListPresenter(coordinator: coordinator, dependencies: container)
        let interactor = ChapterListInteractor(service: service, presenter: presenter, dependencies: container)
        let viewController = ChapterListViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
