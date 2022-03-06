//
//  Coordinator.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
