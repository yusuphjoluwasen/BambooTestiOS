//
//  AppCoordinator.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit
import RxSwift

protocol DetailCoordinatorProtocol: AnyObject {
    func showDetail(_ weather:WeatherDomain?)
    func pop()
}

class AppCoordinator: CoordinatorProtocol {

    var rootNavigationController: UINavigationController!
    let network:WeatherNetworking
    let window: UIWindow?
    let repo:WeatherRepositoryProtocol
    var childCoordinator: CoordinatorProtocol?

    init(window: UIWindow?) {
        self.window = window
        self.network = WeatherNetworking()
        self.repo = WeatherRepository(network: network)
    }
    
    func start() {
        guard let window = window else { return }
        rootNavigationController = UINavigationController(rootViewController: createSearchViewController())
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
    private func createSearchViewController() -> WeatherSearchViewController {
        let viewModel = SearchViewModel(repo: repo)
        let view = WeatherSearchViewController()
        view.viewModel = viewModel
        view.coordinatorDelegate = self
        return view
    }
}

extension AppCoordinator:DetailCoordinatorProtocol{
    func showDetail(_ weather: WeatherDomain?) {
        let view = SearchDetailViewController()
        view.coordinatorDelegate = self
        let viewModel = SearchDetailViewModel(weather: weather)
        view.viewModel = viewModel
        rootNavigationController.pushViewController(view, animated: true)
    }
    
    func pop() {
        rootNavigationController.popViewController(animated: true)
    }
}
