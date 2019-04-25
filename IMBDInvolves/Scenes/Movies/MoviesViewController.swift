//
//  MoviesViewController.swift
//  IMBDInvolves
//
//  Created by Mateus on 11/07/2018.
//  Copyright © 2018 Mateus Ferneda. All rights reserved.
//

import UIKit
import IGListKit

class MoviesViewController: ViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    
    var page: Int = 0
    var refreshControl: UIRefreshControl!
    private var viewModel: MoviesViewModelType = MoviesViewModel()
    private var items: [Movie] = [] {
        didSet {
            adapter.performUpdates(animated: true)
        }
    }
    
//    fileprivate lazy var emptyView: EmptyView? = {
//        let view = R.nib.emptyView.instantiate(withOwner: nil)[firstArrayPosition] as? EmptyView
//        view?.setup(text: R.string.localizable.barConsumptionEmptyLabel(), image: #imageLiteral(resourceName: "ic_consumption_empty"))
//        return view
//    }()
    
    override func prepare() {
        super.prepare()
        initCollectionView()
        navigationController?.navigationBar.topItem?.title = R.string.localizable.movieTile()
    }
    
//    func doRefresh() {
//        reloadLabel.text = R.string.localizable.barConsumptionReloadTitle()
//        viewModel.input.pullToRefresh()
//        viewModel.input.loadMoreItems(skip: initializeLoadItens)
//    }
    
    private func initCollectionView() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        collectionView.backgroundColor = UIColor.App.background
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        //        doRefresh()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.output.isLoading
            .drive(isLoading)
            .disposed(by: disposeBag)
        
        viewModel.output.error
            .drive(onNext: { [weak self] error in
                guard let strongSelf = self else { return }
                strongSelf.showAlert(title: error.localizedDescription, message: String().emptyValue,
                                     buttonText: R.string.localizable.buttonOK(), alertAction: {})
            })
            .disposed(by: disposeBag)
        
        viewModel.output.successfullyGetMovies
            .drive(onNext: { [weak self] result in
                guard let strongSelf = self else { return }
                strongSelf.items += result.results
                
            })
            .disposed(by: disposeBag)
        
        viewModel.input.getUpcomingMovies()
    }
}

extension MoviesViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let section = ListMoviesController()
        section.delegate = self
        return section
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension MoviesViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.height
        let contentSizeHeight = scrollView.contentSize.height
        let offset = scrollView.contentOffset.y
        let reachedBottom = (offset + height == contentSizeHeight)
        
        if reachedBottom {
            scrollViewDidReachBottom(scrollView)
        }
    }
    
    func scrollViewDidReachBottom(_ scrollView: UIScrollView) {
        refreshControl.beginRefreshing()
        viewModel.input.getUpcomingMovies()
    }
}

extension MoviesViewController: MoviesCollectionCellDelegate {
    func movieTapped(on movie: Movie, image: UIImage?) {
        push(to: DetailMovieViewController(image: image, movie: movie))
//        if let index = items.index(where: { (item) -> Bool in
//            item.id == movie.id
//        }) {
//            let indexPath = IndexPath(row: 0, section: index)
//                collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
//            collectionView.reloadItems(at: [indexPath])
//        }
    }
}
