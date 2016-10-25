//
//  SongViewController.swift
//  Chordial
//
//  Created by Ziv Kaputa on 10/23/16.
//  Copyright © 2016 Ziv Kaputa. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    var songs = [String]()
    var albums = [String]()

    
    func loadSampleSongs(){
        songs += ["Pursuit of Happiness"]
        songs += ["How to Save a Life"]
        songs += ["Black and Yellow"]
        songs += ["Hotline Bling"]
        albums += ["Views from the 6"]
        albums += ["The Fray is Gray"]
        albums += ["Wiz Khalifa's Best Tracks"]
        albums += ["Steve Aoki Extended Edition"]

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "SongTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! SongTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let song = songs[indexPath.row]
        let album = albums[indexPath.row]

        
        print(songs)
        cell.titleLabel.text = song
        cell.albumLabel.text = album
        
        //cell.textLabel?.text = song
        
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleSongs()
        
    
        
        //Setup template cell
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SongTableViewCell")
        
        // Setup
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClicked(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {})
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
