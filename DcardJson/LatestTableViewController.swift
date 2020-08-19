//
//  LatestTableViewController.swift
//  DcardJson
//
//  Created by JillOU on 2020/8/18.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class LatestTableViewController: UITableViewController {
    var dcard = [Dcards]()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlStr = "https://www.dcard.tw/_api/posts".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: urlStr){
            let decoder = JSONDecoder()
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let dcards = try? decoder.decode([Dcards].self, from: data){
                    print(dcards[0].title)
                    self.dcard = dcards
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }.resume()
            
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else{
            return dcard.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "navbar", for: indexPath) as! LatestTableViewCell
            tableView.rowHeight = 55
            return cell0
        }else if indexPath.section == 1{
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! LatestTableViewCell
            
            return cell1
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "latestlist", for: indexPath) as! LatestTableViewCell
            cell2.forumnameLabel.text = dcard[indexPath.row].forumName
            cell2.schoolLabel.text = dcard[indexPath.row].school
            cell2.titleLabel.text = dcard[indexPath.row].title
            cell2.detailLabel.text = dcard[indexPath.row].excerpt
            cell2.likecountLabel.text = String(dcard[indexPath.row].likeCount)
            cell2.commentcountLabel.text = String(dcard[indexPath.row].commentCount)
            return cell2
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    @IBSegueAction func toLatestDetailViewController(_ coder: NSCoder) -> LatestDetailViewController? {
        let controller = LatestDetailViewController(coder: coder)
        if let row = tableView.indexPathForSelectedRow?.row{
            print(dcard[row].title)
            controller?.dcarddetail = dcard[row]
        }
        return controller
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
