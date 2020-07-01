//
//  ViewController.swift
//  torotot
//
//  Created by Dane Acena on 6/30/20.
//  Copyright © 2020 daneography. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var audioPlayer:AVAudioPlayer?
    
    let boards = ["air", "fire", "water", "earth"]
    
    let boardImage: [UIImage] = [
        UIImage(named:"air")!,
        UIImage(named:"fire")!,
        UIImage(named:"water")!,
        UIImage(named:"earth")!
    ]
    
    let boardSound:[URL]=[
        Bundle.main.url(forResource: "air", withExtension: "mp3")!,
        Bundle.main.url(forResource: "fire", withExtension: "mp3")!,
        Bundle.main.url(forResource: "water", withExtension: "mp3")!,
        Bundle.main.url(forResource: "earth", withExtension: "mp3")!
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        // Spacings and paddings
        let layout = self.CollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.CollectionView.frame.size.width - 20)/2, height: self.CollectionView.frame.size.height/3)
        
        audioPlayer?.prepareToPlay()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return boards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.boardImage.image = boardImage[indexPath.item]
        cell.boardLabel.text = boards[indexPath.item]
        cell.layer.cornerRadius = 12
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(boards[indexPath.item])
        let url = boardSound[indexPath.item]
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
        
    }

}

