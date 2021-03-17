//
//  oneViewController.swift
//  movies tdy
//
//  Created by apple on 20/11/1942 Saka.
//  Copyright © 1942 apple. All rights reserved.
//

import UIKit
import CoreData

class oneViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getthedata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RetriveTableviewCell", for: indexPath) as! twoTableViewCell
        
        
        let datasss = getthedata[indexPath.row]
//        cell.img.image = datasss.value(forKey: "image") as? UIImage
        cell.lt2.text = datasss.value(forKey: "title") as? String
//        cell.lt2.text = datasss.value(forKey: "rating") as? String
//        cell.genderlbl.text = datasss.value(forKey: "") as? String
//        cell.lt2.text = datasss.value(forKey: "releaseYear") as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    var getthedata : [NSManagedObject] = []
    
    var context = (UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    
    @IBOutlet weak var tab2: UITableView!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        let context = getContext()
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
            do{
                getthedata = try context.fetch(fetchRequest) as! [NSManagedObject]
                
//                print(getthedata)
                
                } catch {
                    print("error")  }
                
                DispatchQueue.main.async {
                    self.tab2.reloadData()
                }
        // Do any additional setup after loading the view.
    }
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
           return appDelegate.persistentContainer.viewContext
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
