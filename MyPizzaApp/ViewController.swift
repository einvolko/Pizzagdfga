//
//  ViewController.swift
//  MyPizzaApp
//
//  Created by Михаил Супрун on 24.02.2024.
//

import UIKit

class ViewController: UIViewController {
    var bool = false
    var duration = 0.5
    @IBOutlet weak var mainCollection: UICollectionView!
    @IBOutlet weak var menuCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let jsonData = try! JSONEncoder().encode(storage)
//        let jsonString = String(data: jsonData, encoding: .utf8)!
//        print(jsonString)
        
        guard let url = URL(string: "https://raw.githubusercontent.com/einvolko/colorTest/main/Products") else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {print(error); return}
            guard let data = data else {return}
            do {storage = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    self.mainCollection.reloadData()
                }}
            catch {print(error)}
        }.resume()
        
      
        mainCollection.register(UINib(nibName: "MainMenuCell", bundle: nil), forCellWithReuseIdentifier: "MainMenuCell")
        menuCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        mainCollection.layer.cornerRadius = 15
        mainCollection.backgroundView = nil
        mainCollection.backgroundColor = UIColor .clear
        menuCollection.backgroundView = nil
        menuCollection.backgroundColor = UIColor .clear
        storage.sort{$0.type < $1.type}
       
    }
    @objc func filterProducts(){
        bool ? currentStorage.sort{$0.cost < $1.cost} : currentStorage.sort{$0.cost > $1.cost}
        bool.toggle()
        UIView.animate(withDuration: duration) {
            self.mainCollection.reloadData()
            self.view.layoutIfNeeded()
        }
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView == mainCollection ? currentStorage.count : Types.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainCollection {
            let cell = mainCollection.dequeueReusableCell(withReuseIdentifier: "MainMenuCell", for: indexPath) as! MainMenuCell
            cell.image.image = UIImage(named: currentStorage[indexPath.item].name)
            cell.name.text = currentStorage[indexPath.item].name
            cell.descriptField.text = currentStorage[indexPath.item].descript
            cell.cost.text = currentStorage[indexPath.item].cost.description
            setupShadow(cell: cell)
            
            return cell }
        
        if collectionView == self.menuCollection {
            let cell = menuCollection.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            cell.category.text = String(describing: Types.allCases[indexPath.item]).uppercased()
            cell.button.addTarget(self, action: #selector(filterProducts), for: .touchUpInside)
            cell.backgroundColor = UIColor.lightText
            setupShadow(cell: cell)

            return cell
            }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mainCollection {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailVC") as! DetailVC
            self.present(vc, animated: true) {
                vc.image.image = UIImage(named: currentStorage[indexPath.item].name)
                vc.name.text = currentStorage[indexPath.item].name
                vc.descript.text = currentStorage[indexPath.item].descript
                vc.cost.text = currentStorage[indexPath.item].cost.description
            }
        }
        if collectionView == menuCollection {
            menuCollection.reloadItems(at: [indexPath])
            menuCollection.cellForItem(at: indexPath)?.backgroundColor = .opaqueSeparator
            
            
           let type =  Types.allCases[indexPath.item]
            currentStorage.removeAll()
            for i in storage {
                if i.type == type {currentStorage.append(i)}
            }
            if type == .allProducts {currentStorage = storage.sorted{$0.type < $1.type}}
            UIView.animate(withDuration: duration) {
                self.mainCollection.reloadData()
                self.view.layoutIfNeeded()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView == mainCollection ? CGSize(width: view.frame.width - 10, height: view.frame.height / 5) : CGSize(width: view.frame.width, height: menuCollection.frame.height - 20)
    }
  
}
