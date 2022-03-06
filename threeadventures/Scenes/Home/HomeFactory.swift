import UIKit

enum HomeFactory {
    static func make(with delegate: MainCoordinating) -> UIViewController {
        let service = HomeService()
        let coordinator = HomeCoordinator(delegate: delegate)
        let presenter = HomePresenter(coordinator: coordinator)
        let interactor = HomeInteractor(service: service, presenter: presenter)
        let viewController = HomeViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
