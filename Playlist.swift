//
//  Playlist.swift
//  Algorhythm
//
//  Created by Christine Rose on 4/5/15.
//  Copyright (c) 2015 Christine Rose. All rights reserved.
//

import Foundation
import UIKit //added this to use UIImage below

struct Playlist {
    //using this struct to pull info from the MusicLibrary struct
    var title: String? //create variable for title, optional
    var description: String?
    var icon: UIImage? //to use this, we have to import UIKit, above
    var largeIcon: UIImage?
    var artists: [String] = []
    var backgroundColor: UIColor = UIColor.clearColor()
    //works when UIKit is imported above
    
    //must initialize struct next:
    init(index: Int) {
        //using index value from MusicLibrary. This works only because we hard-coded data in MusicLibrary
        
        let musicLibrary = MusicLibrary().library
        let playlistDictionary = musicLibrary[index]
        
        title = playlistDictionary["title"] as String!  //gets string from playlist, & unwaps optional (above) with !
        description = playlistDictionary["description"] as String!
        
        let iconName = playlistDictionary["icon"] as String!
        icon = UIImage(named: iconName)
        
        
        
        let largeIconName = playlistDictionary["largeIcon"] as String!
        largeIcon = UIImage(named: largeIconName)
        
        artists += playlistDictionary["artists"] as [String]
        
        let colorsDictionary = playlistDictionary["backgroundColor"] as [String: CGFloat]
        backgroundColor = rgbColorFromDictionary(colorsDictionary)
        
    }
    
    func rgbColorFromDictionary(colorDictionary: [String: CGFloat]) -> UIColor {
        
        let red = colorDictionary["red"]!
        let green = colorDictionary["green"]!
        let blue = colorDictionary["blue"]!
        let alpha = colorDictionary["alpha"]!
        
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        
    }

}



