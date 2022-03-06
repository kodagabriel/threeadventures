import UIKit

enum AgeCheckFactory {
    static func make() -> UIViewController {
        let service = AgeCheckService()
        let coordinator = AgeCheckCoordinator()
        let presenter = AgeCheckPresenter(coordinator: coordinator)
        let interactor = AgeCheckInteractor(service: service, presenter: presenter)
        let viewController = AgeCheckViewController(interactor: interactor)

        coordinator.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
