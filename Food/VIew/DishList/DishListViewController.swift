//
//  DishListViewController.swift
//  Food
//
//  Created by Abdelnasser on 18/09/2021.
//

import UIKit
import  ProgressHUD

class DishListViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    
    var categories:Category!
    var dishes:[Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = categories.title
        register()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: categories.id ?? "" ){
            (result) in
            switch result{
            case .success(let dishes):
                ProgressHUD.dismiss()
                self.dishes = dishes
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

extension DishListViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifir)as!DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailsViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
