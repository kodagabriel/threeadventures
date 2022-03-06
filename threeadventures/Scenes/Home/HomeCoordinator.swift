import UIKit

enum HomeAction {
    // template
}

protocol HomeCoordinating: AnyObject {
    func perform(action: HomeAction)
}

final class HomeCoordinator {

    weak var viewController: UIViewController?
    private let delegate: MainCoordinating

    init(delegate: MainCoordinating) {
        self.delegate = delegate
    }
}

// MARK: - HomeCoordinating
extension HomeCoordinator: HomeCoordinating {
    func perform(action: HomeAction) {
        // template
    }
}
