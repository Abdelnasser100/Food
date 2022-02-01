//
//  HomeViewController.swift
//  Food
//
//  Created by Abdelnasser on 14/09/2021.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var caegoryCollectionView: UICollectionView!
    @IBOutlet weak var PopularDishCollectionView: UICollectionView!
    @IBOutlet weak var chefSpecialsCollectionView: UICollectionView!
    
    var categories:[Category] = []
    
    var populars:[Dish] = []
    
    var chef:[Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProgressHUD.show()
        
        NetworkService.shared.fetchAllCategories{[weak self] (result) in
            switch result{
            case .success(let allDishes):
                ProgressHUD.dismiss()
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.chef = allDishes.specials ?? []
                
                self?.caegoryCollectionView.reloadData()
                self?.PopularDishCollectionView.reloadData()
                self?.chefSpecialsCollectionView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }

        caegoryCollectionView.delegate = self
        caegoryCollectionView.dataSource = self
        PopularDishCollectionView.delegate = self
        PopularDishCollectionView.dataSource = self
        chefSpecialsCollectionView.delegate = self
        chefSpecialsCollectionView.dataSource = self
        
        registerCells()
     
    }
    
    
    
    private func registerCells(){

        caegoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifir, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifir)
        
        PopularDishCollectionView.register(UINib(nibName:PopularDishCollectionViewCell.identifir, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifir)
        
        chefSpecialsCollectionView.register(UINib(nibName: ChefSpecialsCollectionViewCell.identifir, bundle: nil), forCellWithReuseIdentifier: ChefSpecialsCollectionViewCell.identifir)
    
    }

}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case caegoryCollectionView:
            return categories.count
        case PopularDishCollectionView:
            return populars.count
        case chefSpecialsCollectionView:
            return chef.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case caegoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifir, for: indexPath)as!CategoryCollectionViewCell
            
              cell.setUP(category: categories[indexPath.row])
              return cell
            
            
        case PopularDishCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDishCollectionViewCell.identifir, for: indexPath)as!PopularDishCollectionViewCell
            
            cell.setUp(dish:populars[indexPath.row])
            return cell
            
        case chefSpecialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefSpecialsCollectionViewCell.identifir, for: indexPath)as!ChefSpecialsCollectionViewCell
            
            cell.setup(dish:chef[indexPath.row])
            return cell
            
        default:
            return UICollectionViewCell()
        }
   
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           
        if collectionView == caegoryCollectionView{
            let controller = DishListViewController.instantiate()
            controller.categories = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else{
            let controller = DishDetailsViewController.instantiate()
            controller.dish = collectionView == PopularDishCollectionView ?
                populars[indexPath.row] : chef[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }


}

