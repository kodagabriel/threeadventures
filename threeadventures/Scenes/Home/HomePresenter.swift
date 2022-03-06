import Foundation

protocol HomePresenting: AnyObject {
    func displaySomething()
    func didNextStep(action: HomeAction)
}

final class HomePresenter {

    private let coordinator: HomeCoordinating
    weak var viewController: HomeDisplaying?

    init(coordinator: HomeCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - HomePresenting
extension HomePresenter: HomePresenting {
    func displaySomething() {
        viewController?.displaySomething()
    }

    func didNextStep(action: HomeAction) {
        coordinator.perform(action: action)
    }
}
