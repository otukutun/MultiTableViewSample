//
//  ViewController.swift
//  MultiTableViewSample
//
//  Created by otukutun on 12/2/16.
//  Copyright © 2016 otukutun. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate {
    @IBOutlet weak var tableViewFirst: UITableView!
    @IBOutlet weak var tableViewSecond: UITableView!
    @IBOutlet weak var tableViewThird: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewFirst.delegate = self
        tableViewFirst.dataSource = self
        
        tableViewSecond.delegate = self
        tableViewSecond.dataSource = self
        
        tableViewThird.delegate = self
        tableViewThird.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return 3
        } else if tableView.tag == 1 {
            return 1
        } else {
            return 2
        }
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var uiTableView:UITableView
        var cellIdentifier:String
        if tableView.tag == 0 {
            uiTableView = tableViewFirst
            cellIdentifier = "tableViewFirstCell"
        } else if tableView.tag == 1 {
            uiTableView = tableViewSecond
            cellIdentifier = "tableViewSecondCell"
        } else {
            uiTableView = tableViewThird
            cellIdentifier = "tableViewThirdCell"
        }
        let cell = uiTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = "hogehoge"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched")
        //// Safari Viewを用意.
        if tableView.tag == 0 {
            let _url:NSURL = NSURL(string: "http://otukutun.hatenablog.com/")!
            let brow = SFSafariViewController(url: _url as URL, entersReaderIfAvailable: true)
            brow.delegate = self
            present(brow, animated: true, completion: nil)
        }
    }
}
