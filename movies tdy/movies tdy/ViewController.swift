//
//  ViewController.swift
//  movies tdy
//
//  Created by apple on 09/01/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import CoreData
struct root:Codable
{
    let title:String?
    let image:String?
    let releaseYear:Int?
    let rating:Double?
    let genre:[String]
   
    }

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    
    var getmovies = [root]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "one", for: indexPath)as! oneTableViewCell
       // cell.l1.text = "\(name[indexPath.row])\n" + "\(num[indexPath.row])\n" + "\(num2[indexPath.row])\n" + "\(name1[indexPath.row])\n"
//        let ur2 = pic[indexPath.row]
//        let url3 = URL(string: ur2)
//        let dat = NSData(contentsOf: url3!)
//        cell.img1.image = UIImage(data: dat as! Data)
        cell.l1.text = name[indexPath.row]
       // cell.l1.text = String(getmovies[indexPath.row].releaseYear!)
        //cell.l1.text = String(getmovies[indexPath.row].rating!)
       
            let datasaved = NSEntityDescription.insertNewObject(forEntityName: "Movies", into: context)
            
//            datasaved.setValue(getmovies[indexPath.row].image, forKey: "image")
            datasaved.setValue(getmovies[indexPath.row].title, forKey: "title")
        print(datasaved)
           // datasaved.setValue(getmovies[indexPath.row].releaseYear, forKey: "releaseYear")
          //  datasaved.setValue(getmovies[indexPath.row].rating, forKey: "rating")
      //  datasaved.setValue(getmovies[indexPath.row].genre, forKey: "genre")
        
        do {
            try context.save()
        } catch{
            print(datasaved)
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func getdata(_ sender: Any) {
        
        
        self.performSegue(withIdentifier: "segue1", sender: self)
       
    }
    @IBOutlet weak var tab1: UITableView!
    var name = [String]()
    var name1 = [[String]]()
    var pic = [String]()
    var num = [Int]()
    var num2 = [Double]()

    override func viewDidLoad() {
      getdata()
        super.viewDidLoad()
          
    }
    func getdata()
    {
        guard let url = URL(string: "https://api.androidhive.info/json/movies.json") else {return}
                  let url1 = URLSession.shared.dataTask(with: url){(data,response,error)in
                  guard error == nil else{return}
                  guard let Getdata = data else {return}
                      do{
                          let mydata = try!JSONDecoder().decode([root].self, from: Getdata)
                          for index in mydata
                          
                          {
                              self.name.append(index.title!)
                            self.name1.append(index.genre)
                             //  self.pic.append(index.image!)
                              self.num.append(index.releaseYear!)
                            self.num2.append(index.rating!)

                          }
                          DispatchQueue.main.async {
                              self.tab1.reloadData()
                          }
                          
                          
                      } catch{
                          print(error)
                      }
            }
            url1.resume()
        }
    }


