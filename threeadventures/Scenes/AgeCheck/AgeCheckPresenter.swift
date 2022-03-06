import Foundation

protocol AgeCheckPresenting: AnyObject {
    func displaySomething()
    func didNextStep(action: AgeCheckAction)
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
    func displaySomething() {
        viewController?.displaySomething()
    }

    func didNextStep(action: AgeCheckAction) {
        coordinator.perform(action: action)
    }
}
