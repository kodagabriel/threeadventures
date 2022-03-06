//
//  MainCoordinator.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    private let service: UserSettingsServiceProtocol

    init(service: UserSettingsServiceProtocol = UserSettingsService()) {
        navigationController = UINavigationController()
        self.service = service
    }

    func start() {}

    func start() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = decideFirstScene()
        // futuramente pode ficar aqui a verificação de se já tem idade ou não
        window.makeKeyAndVisible()
        return window
    }
    
    private func decideFirstScene() -> UIViewController {
        if service.isUserOverEightteen() {
            return UIViewController()
        } else {
            let ageCheckController = AgeCheckFactory.make()
            return ageCheckController
        }
    }

}
