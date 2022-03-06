//
//  MainEntranceService.swift
//  threeadventures
//
//  Created by Koda Gabriel on 06/03/22.
//

import Foundation

protocol UserSettingsServiceProtocol: AnyObject {
    func saveUserIsOverEighteen()
    func isUserOverEightteen() -> Bool
}


final class UserSettingsService: UserSettingsServiceProtocol {
    enum UserDefaultLoginKeys: String {
        case isUserOverEighteen
        case isUserLoggedIn
    }
    func saveUserIsOverEighteen() {
        UserDefaults.standard.set(true, forKey: UserDefaultLoginKeys.isUserOverEighteen.rawValue)
    }
    
    func isUserOverEightteen() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultLoginKeys.isUserOverEighteen.rawValue)
    }
}
