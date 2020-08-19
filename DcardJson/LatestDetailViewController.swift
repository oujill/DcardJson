//
//  LatestDetailViewController.swift
//  DcardJson
//
//  Created by JillOU on 2020/8/18.
//  Copyright © 2020 Jillou. All rights reserved.
//

import UIKit

class LatestDetailViewController: UIViewController {

    var dcarddetail:Dcards!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = dcarddetail.title
        detailLabel.text = dcarddetail.excerpt
        // Do any additional setup after loading the view.
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
