//
//  matchesPageViewController.swift
//  recipeApplication
//
//  Created by Mustafa Bedir Tapkan on 11/23/15.
//  Copyright © 2015 Mustafa Bedir Tapkan. All rights reserved.
//

import UIKit

class matchesPageViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var matchesTableView: UITableView!
    
    var dataArray: Array<Dictionary<String,Any>> = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // REGISTER CUSTOM CELL
        
        let nib = UINib(nibName: "vwTblCellForMatches" , bundle: nil)
        matchesTableView.registerNib(nib, forCellReuseIdentifier: "cell")
        print(dataArray)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return myData.myFunc().counter
        
        return dataArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: TblCellForMatches = self.matchesTableView.dequeueReusableCellWithIdentifier("cell") as! TblCellForMatches
        cell.matchesLabel.text = dataArray[indexPath.row]["title"] as? String
        //data.myFunc().myset[indexPath.row]
        
        cell.matchesImage.image = UIImage(named: dataArray[indexPath.row]["title"] as! String)
        // if images name is same as in tableData put it in front of label
        
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let recipesPage: recipesPageViewController = segue.destinationViewController as! recipesPageViewController
        
        if let selectedCell = sender as? TblCellForMatches {
            let indexPath = matchesTableView.indexPathForCell(selectedCell)!
            let selectedRecipe = dataArray[indexPath.row]
            //recipesPage.meal = selectedRecipe
            recipesPage.recipeTitle.text = selectedRecipe["title"] as? String
            //recipesPage.recipeDescription.text =
            //recipesPage.recipeImage.image =

        }
        
    }
    
    
}
