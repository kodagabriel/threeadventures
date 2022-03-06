import Foundation

protocol AgeCheckInteracting: AnyObject {
    func setUserOverEighteen()
}

final class AgeCheckInteractor {

    private let service: AgeCheckServicing
    private let userSettingsService: UserSettingsServicing
    private let presenter: AgeCheckPresenting

    init(service: AgeCheckServicing,
         presenter: AgeCheckPresenting,
         userSettingsService: UserSettingsServicing = UserSettingsService()) {
        self.service = service
        self.presenter = presenter
        self.userSettingsService = userSettingsService
    }
}

// MARK: - AgeCheckInteracting
extension AgeCheckInteractor: AgeCheckInteracting {
    func setUserOverEighteen() {
        userSettingsService.saveUserIsOverEighteen()
        presenter.goToHome()
    }
}
