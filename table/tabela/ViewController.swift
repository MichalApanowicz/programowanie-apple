//
//  ViewController.swift
//  tabela
//
//  Created by Student on 29/10/2018.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "kom")
        cell?.textLabel?.text="kom\(indexPath.row)"
        return cell!
    }

    override func prepare(for seque: UIStoryboardSegue, sender:Any?){
        let dc = seque.destination as? DetailViewController
        if let cell = sender as? UITableViewCell{
            var index = tableView.indexPath(for: cell)
            dc?.bookNo = index?.row
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
   // override func prepare(for seque : UIStoryboardSegue, sender Any?){
       // let dc = seque.destination as? DetailViewController dc.?bookNo = 6
        
        
    


}

