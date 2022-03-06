import UI

protocol ChapterListDisplaying: AnyObject {
    func displaySomething()
}

private extension ChapterListViewController.Layout {
    // example
    enum Size {
        static let imageHeight: CGFloat = 90.0
    }
}

final class ChapterListViewController: ViewController<ChapterListInteracting, UIView> {
    fileprivate enum Layout { 
        // template
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        interactor.doSomething()
    }

    override func buildViewHierarchy() { 
        // template
    }
    
    override func setupConstraints() { 
        // template
    }

    override func configureViews() { 
        // template
    }
}

// MARK: - ChapterListDisplaying
extension ChapterListViewController: ChapterListDisplaying {
    func displaySomething() { 
        // template
    }
}
