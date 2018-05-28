//
//  MainViewController.swift
//  CoreAnimationExercise
//
//  Created by Jinya Tu on 2018/5/28.
//  Copyright © 2018年 Jinya Tu. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    // vc ids array in storyboard
    let vcIdsArray: [String] = [
        "ClockViewController"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vcIdsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = vcIdsArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let module = "CoreAnimationExercise"
//        guard let cls = NSClassFromString(module + "." + vcArray[indexPath.row]) as? UIViewController.Type else {
//            return
//        }
//        let vc = cls.init()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc: UIViewController = sb.instantiateViewController(withIdentifier: vcIdsArray[indexPath.row]) as? UIViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
