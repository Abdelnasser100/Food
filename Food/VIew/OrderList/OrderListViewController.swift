//
//  OrderListViewController.swift
//  Food
//
//  Created by Abdelnasser on 19/09/2021.
//

import UIKit
import  ProgressHUD

class OrderListViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    
    var orders:[Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Order"
        register()
        ProgressHUD.show()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NetworkService.shared.fetchOrders{ (result) in
            switch result{
            case .success(let orders):
                ProgressHUD.dismiss()
                self.orders = orders
                self.tabelView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    private func register(){
        tabelView.register(UINib(nibName: DishListTableViewCell.identifir, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifir)
    }
    
}

extension OrderListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifir)as!DishListTableViewCell
        
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let vc = storyboard?.instantiateViewController(identifier: DishDetailsViewController.identifier)as!DishDetailsViewController
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
