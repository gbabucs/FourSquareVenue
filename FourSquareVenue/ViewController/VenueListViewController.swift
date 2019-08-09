//
//  VenueListViewController.swift
//  FourSquareVenue
//
//  Created by ThunderFlash on 09/08/2019.
//  Copyright © 2019 system. All rights reserved.
//

import UIKit
import Reachability
import IHProgressHUD

class VenueListViewController: UIViewController {
    
    //--------------------------------------------------------------------------
    // MARK: - IBOutlet
    //--------------------------------------------------------------------------
    
    @IBOutlet weak var tableView: UITableView!
    
    //--------------------------------------------------------------------------
    // MARK: - properties
    //--------------------------------------------------------------------------
    
    let reachability : Reachability! = Reachability()
    var queryParams: SearchParameter?
    var viewModel = VenueListViewModel()
    
    private(set) var venues: [Venue]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private(set) var selectedVenue: Venue?
    
    private var isReachable: Bool {
        guard reachability.connection != .none else {
            return false
        }
        return true
    }
    
    //--------------------------------------------------------------------------
    // MARK: - LifeCyle
    //--------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Product List"
        
        self.getVenueList()
        self.startWatchingReachability()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 115
        tableView.tableFooterView = UIView()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Private functions
    //--------------------------------------------------------------------------
    
    @objc private func getVenueList() {
        if isReachable {
            //DispatchQueue.global(qos: .default).async(execute: {
            IHProgressHUD.show()
            viewModel.getVenueList(with: queryParams) { success in
                DispatchQueue.main.async {
                    if success, self.viewModel.isEmptyVenue == false {
                        self.tableView.reloadData()
                    } else {
                        //TODO: Handle Network Error
                        self.showErrorAlert(fot: "Error", message: "Please try again later")
                    }
                    
                    IHProgressHUD.dismiss()
                }
            }
        } else {
            self.showErrorAlert(fot: "No Internet Connection", message: "Please try again later")
        }
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Helper functions
    //--------------------------------------------------------------------------
    
    func startWatchingReachability() {
        try? self.reachability.startNotifier()
    }
    
    //--------------------------------------------------------------------------
    // MARK: - Navigation
    //--------------------------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showVenueDetailViewController",
            let venueDetailViewController = segue.destination as? VenueDetailViewController,
            let indexPath = sender as? IndexPath,
            let venue  = viewModel.selectedObject(indexPath: indexPath)
            else { return }
        
        venueDetailViewController.venue = venue
        
        guard let selectedCell = tableView.indexPathForSelectedRow else { return }
        
        tableView.deselectRow(at: selectedCell, animated: false)
    }
    
}


//--------------------------------------------------------------------------
// MARK: - UITableViewDelegate
//--------------------------------------------------------------------------


extension VenueListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showVenueDetailViewController", sender: indexPath)
    }
}

//--------------------------------------------------------------------------
// MARK: - UITableViewDataSource
//--------------------------------------------------------------------------

extension VenueListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VenueListCell.reuseIdentifier, for: indexPath) as? VenueListCell
            else { return UITableViewCell() }
        
        viewModel.update(cell, at: indexPath)
        
        return cell
    }
}

