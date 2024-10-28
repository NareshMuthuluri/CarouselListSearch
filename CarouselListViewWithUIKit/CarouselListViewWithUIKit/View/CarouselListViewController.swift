//
//  ViewController.swift
//  CarouselListViewWithUIKit
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import UIKit

class CarouselListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let viewModel = CarouselViewModel()
    
    private var isBottomSheetVisible = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        carouselCollectionView.collectionViewLayout = layout
        layout.itemSize.width = carouselCollectionView.frame.size.width
        layout.itemSize.height = carouselCollectionView.frame.size.height
        
        pageControl.numberOfPages = viewModel.items.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .lightGray
        
    }
    
    @IBAction func showButton(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let bottomSheetVC = storyboard.instantiateViewController(withIdentifier: "BottomSheetViewController")
        bottomSheetVC.modalPresentationStyle = .pageSheet
        self.present(bottomSheetVC, animated: true)
    }
    
}


extension CarouselListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselImageCell", for: indexPath) as? CarouselImageCollectionViewCell {
            cell.imageView.image = UIImage(named: viewModel.items[indexPath.row].imageName)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
    }
    
    
}

extension CarouselListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.items = viewModel.items.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
}

extension CarouselListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell
        cell?.imageName.image = UIImage(named: viewModel.items[indexPath.row].imageName)
        cell?.title.text = viewModel.items[indexPath.row].name
        cell?.descriptionLabel.text = viewModel.items[indexPath.row].description
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
