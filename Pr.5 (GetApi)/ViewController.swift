//
//  ViewController.swift
//  Pr.5 (GetApi)
//
//  Created by Choudhary Dipika on 25/03/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    var welcome : [WelcomeElement] = []
    var welcome2 : [WelcomeElement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData()
    {
        let url = URL(string: "https://restcountries.com/v3.1/all")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        URLSession.shared.dataTask(with: ur) { data, response, error in
             do
             {
                 if error
                        == nil{
                     self.welcome = try JSONDecoder().decode([WelcomeElement].self, from: data!)
                     self.welcome2 = self.welcome
                     DispatchQueue.main.async {
                         self.tableView.reloadData()
                     }
                 }
             }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return welcome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.flagimage.image = linkToImage(link: welcome[indexPath.row].flags.png)
        cell.countryName.text = welcome[indexPath.row].name.common
        cell.country.text = welcome[indexPath.row].name.official
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigation(fImg: linkToImage(link: welcome[indexPath.row].flags.png), fName: welcome[indexPath.row].name.common,fPopulation: welcome[indexPath.row].population,fCurrency: linkToImage(link: welcome[indexPath.row].coatOfArms.png!))
    }
    
    func navigation(fImg:UIImage,fName:String,fPopulation:Int,fCurrency:UIImage)
    {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewControllerNavigate") as! ViewControllerNavigate
        navigate.flagImg = fImg
        navigate.flagN = fName
        navigate.flagP = fPopulation
        navigate.flagC = fCurrency
        navigationController?.pushViewController(navigate, animated: true)
    }
    
    func linkToImage(link:String) -> UIImage
    {
        let url1 = URL(string: link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)!
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == ""
        {
            welcome = welcome2
        }
        else
        {
            welcome = welcome2.filter({ i in
                return i.name.common.contains(searchBar.text!)
            })
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

