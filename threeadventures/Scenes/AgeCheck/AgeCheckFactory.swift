import UIKit

enum AgeCheckFactory {
    static func make(with delegate: MainCoordinating) -> UIViewController {
        let service = AgeCheckService()
        let coordinator = AgeCheckCoordinator(delegate: delegate)
        let presenter = AgeCheckPresenter(coordinator: coordinator)
        let interactor = AgeCheckInteractor(service: service, presenter: presenter)
        let viewController = AgeCheckViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
