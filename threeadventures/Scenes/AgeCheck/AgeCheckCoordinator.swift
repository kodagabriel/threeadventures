import UIKit

enum AgeCheckAction {
    // template
}

protocol AgeCheckCoordinating: AnyObject {
    func perform(action: AgeCheckAction)
}

final class AgeCheckCoordinator {

    weak var viewController: UIViewController?

    init() {
    }
}

// MARK: - AgeCheckCoordinating
extension AgeCheckCoordinator: AgeCheckCoordinating {
    func perform(action: AgeCheckAction) {
        // template
    }
}
