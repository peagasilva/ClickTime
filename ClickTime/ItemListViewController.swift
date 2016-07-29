//
//  ItemListViewController.swift
//  ClickTime
//
//  Created by Raphael Silva on 7/27/16.
//  Copyright © 2016 Raphael Silva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ItemListViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    // MARK: let
    
    private let disposeBag = DisposeBag()
    
    // MARK: var
    
    var itemListViewModel = ItemListViewModel()
    
    // MARK: - Methods
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemListViewModel.observableItems()
            .bindTo(tableView.rx_itemsWithCellIdentifier(UITableViewCell.defaultIdentifier, cellType: UITableViewCell.self)) { [weak self] (row, _, cell) in
                cell.textLabel?.text = self?.itemListViewModel.titleForItemAtIndexPathRow(row)
            }.addDisposableTo(disposeBag)
        
        itemListViewModel.observableItems()
            .subscribeNext { [weak self] _ in
                self?.tableView.reloadData()
            }.addDisposableTo(disposeBag)
    }
    
    // MARK: - IBActions
    
    @IBAction func addItemAction(sender: UIBarButtonItem) {
        itemListViewModel.createItem()
    }
    
    @IBAction func removeAllItemsAction(sender: UIBarButtonItem) {
        itemListViewModel.removeAllItems()
    }
}
