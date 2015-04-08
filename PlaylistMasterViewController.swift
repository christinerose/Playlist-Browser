//
//  ViewController.swift
//  Algorhythm
//
//  Created by Christine Rose on 4/4/15.
//  Copyright (c) 2015 Christine Rose. All rights reserved.
//

import UIKit

class PlaylistMasterViewController: UIViewController {
    
    var playlistArray: [UIImageView] = []
    //array to set up all playlists

    
    @IBOutlet weak var playlistImageView0: UIImageView!
    @IBOutlet weak var playlistImageView1: UIImageView!
    @IBOutlet weak var playlistImageView2: UIImageView!
    @IBOutlet weak var playlistImageView3: UIImageView!
    @IBOutlet weak var playlistImageView4: UIImageView!
    @IBOutlet weak var playlistImageView5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playlistArray += [playlistImageView0, playlistImageView1, playlistImageView2, playlistImageView3, playlistImageView4, playlistImageView5]
        
        for index in 0..<playlistArray.count { //gets range of numbers representing the number in playlistArray
            let playlist = Playlist(index: index) //instance
            let playlistImageView = playlistArray[index]
            
            playlistImageView.image = playlist.icon
            playlistImageView.backgroundColor = playlist.backgroundColor
        } //gets all cover images and playlists
        
        
        playlistArray.append(playlistImageView0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //overrides the built-in prepareForSegue method
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPlaylistDetail" {
            
            
            let playlistImageView = sender!.view as UIImageView //sets up to check which playlist was selected
            if let index = find(playlistArray, playlistImageView) { //finds index # & assigns to variable
                let playlistDetailController = segue.destinationViewController as PlaylistDetailViewController
                //this is called downcasting
                playlistDetailController.playlist = Playlist(index: index)
            } // end of if let

        } //end of if segue.id
        
    } //end of override func prepare...

    @IBAction func showPlaylistDetail(sender: AnyObject) { //tap recognizer
        //println("Hey! Stop Touching Me") //to test action
        performSegueWithIdentifier("showPlaylistDetailSegue", sender: sender)
    }
}

