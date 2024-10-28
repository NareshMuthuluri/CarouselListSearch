//
//  BottomSheetViewController.swift
//  CarouselListViewWithUIKit
//
//  Created by Naresh Muthuluri on 28/10/24.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var totalItem: UILabel!
    @IBOutlet weak var topThreeOccurances: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    private let viewModel = CarouselViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStatistics()
    }
    
    private func setupStatistics() {
        totalItem.text = "Total Items: \(viewModel.itemCount)"
        topThreeOccurances.text = "Top 3 Occurrences:"
    }
    
}

extension BottomSheetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(viewModel.characterOccurrences[indexPath.row].character) = \(viewModel.characterOccurrences[indexPath.row].count)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
}
