//
//  ViewController.swift
//  lesprivate_ios
//
//  Created by Radhika Yusuf on 07/05/20.
//  Copyright © 2020 Radhika Yusuf. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    @IBOutlet weak var imageContent: UIImageView!
    @IBOutlet weak var titleContent: UILabel!
    @IBOutlet weak var descContent: UILabel!
    
    private var position = 0
    private weak var backgroundTimer: Timer? = nil
    
    private let dataSet = [
        SplashModel(imageName: "nature", title: "Bali", desc: "Is a province of Indonesia and the westernmost of the Lesser Sunda Islands. Located east of Java and west of Lombok, the province includes the island of Bali and a few smaller neighbouring islands, notably Nusa Penida, Nusa Lembongan, and Nusa Ceningan"),
        SplashModel(imageName: "nature1", title: "Lombok", desc: "Is an island in West Nusa Tenggara province, Indonesia. It forms part of the chain of the Lesser Sunda Islands, with the Lombok Strait separating it from Bali to the west and the Alas Strait between it and Sumbawa to the east.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        backgroundTimer?.invalidate()
    }
    
    func runTimer() {
        backgroundTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            self.changeImage(data: self.dataSet[self.position])
            self.position += 1
            
            if self.position == self.dataSet.count {
                self.position = 0
            }
        }
    }
    
    func changeImage(data: SplashModel) {
        titleContent.text = data.title
        descContent.text = data.desc
        UIView.transition(
            with: self.imageContent,
            duration: 1.5,
            options: .transitionCrossDissolve,
            animations: {
                self.imageContent.image = UIImage(named: data.imageName)
            },
            completion: nil)
    }
}

