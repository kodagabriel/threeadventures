import UIKit

enum AgeCheckAction {
    case goToHome
}

protocol AgeCheckCoordinating: AnyObject {
    func perform(action: AgeCheckAction)
}

final class AgeCheckCoordinator {

    weak var viewController: UIViewController?
    private let delegate: MainCoordinating

    init(delegate: MainCoordinating) {
        self.delegate = delegate
    }
}

// MARK: - AgeCheckCoordinating
extension AgeCheckCoordinator: AgeCheckCoordinating {
    func perform(action: AgeCheckAction) {
        switch action {
        case .goToHome:
            delegate.doAction(.goToHome)
        }
    }
}
