import Foundation

protocol AgeCheckPresenting: AnyObject {
    func goToHome()
}

final class AgeCheckPresenter {

    private let coordinator: AgeCheckCoordinating
    weak var viewController: AgeCheckDisplaying?

    init(coordinator: AgeCheckCoordinating) {
        self.coordinator = coordinator
    }
}

// MARK: - AgeCheckPresenting
extension AgeCheckPresenter: AgeCheckPresenting {
    func goToHome() {
        coordinator.perform(action: .goToHome)
    }
}
