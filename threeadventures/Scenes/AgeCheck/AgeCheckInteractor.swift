import Foundation

protocol AgeCheckInteracting: AnyObject {
    func doSomething()
}

final class AgeCheckInteractor {

    private let service: AgeCheckServicing
    private let presenter: AgeCheckPresenting

    init(service: AgeCheckServicing, presenter: AgeCheckPresenting) {
        self.service = service
        self.presenter = presenter
    }
}

// MARK: - AgeCheckInteracting
extension AgeCheckInteractor: AgeCheckInteracting {
    func doSomething() {
        presenter.displaySomething()
    }
}
