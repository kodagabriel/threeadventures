//
//  ViewController.swift
//  threeadventures
//
//  Created by Koda Gabriel on 27/02/22.
//

import UIKit

public protocol ViewConfiguration: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func configureStyles()
    func buildLayout()
}

public extension ViewConfiguration {
    func buildLayout() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    func configureViews() { }

    func configureStyles() { }
}

open class ViewController<Interactor, V: UIView>: UIViewController, ViewConfiguration {
    public let interactor: Interactor
    public var rootView = V()

    public init(interactor: Interactor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            print("NavigationDebug – " + String(describing: type(of: self)))
        #endif
        buildLayout()
    }

    override open func loadView() {
        view = rootView
    }

    open func buildViewHierarchy() { }

    open func setupConstraints() { }

    open func configureViews() { }
}

public extension ViewController where Interactor == Void {
    convenience init(_ interactor: Interactor = ()) {
        self.init(interactor: interactor)
    }
}
