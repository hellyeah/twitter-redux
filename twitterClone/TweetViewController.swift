//
//  TweetViewController.swift
//  twitterClone
//
//  Created by David Fontenot on 10/3/15.
//  Copyright © 2015 David Fontenot. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tweet: Tweet!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tweetName = tweet.user?["name"] as? String
        print("tweet: \(tweetName)")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Set up table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TweetDetailCell") as? TweetDetailCell
            cell!.tweet = tweet
            return cell!
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("FeatureCell") as? FeatureCell
            cell!.tweet = tweet
            return cell!
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "popToReplyModal" {
            let vc = segue.destinationViewController as? ComposeViewController
            vc!.id = self.tweet.id_as_string
        }
    }
    
}

