//
//  MainCoordinator.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

protocol MainCoordinating: AnyObject {
    var navigationController: UINavigationController { get set }
    func doAction(_ action: MainCoordinator.Actions)
}

class MainCoordinator {
    enum Actions {
        case goToHome
    }
    var navigationController: UINavigationController
    private let service: UserSettingsServicing

    init(service: UserSettingsServicing = UserSettingsService()) {
        navigationController = UINavigationController()
        self.service = service
    }

    func getWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }

    func start() {
        let viewController = decideFirstScene()
        navigationController.pushViewController(viewController, animated: true)
    }

    private func decideFirstScene() -> UIViewController {
        if service.isUserOverEightteen() {
            let homeController = HomeFactory.make(with: self)
            return homeController
        } else {
            let ageCheckController = AgeCheckFactory.make(with: self)
            return ageCheckController
        }
    }
}

extension MainCoordinator: MainCoordinating {
    func doAction(_ action: MainCoordinator.Actions) {
        switch action {
        case .goToHome:
            let homeController = HomeFactory.make(with: self)
            navigationController.pushViewController(homeController, animated: true)
        }
    }
}
