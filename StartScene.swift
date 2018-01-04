//
//  StartScene.swift
//  TapWars MultiPlayer
//
//  Created by Tomas Ward on 10/10/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import StoreKit
import AudioToolbox
import AVFoundation

var button = SKSpriteNode()
var title = SKSpriteNode()
var subtitle = SKSpriteNode()
var best = SKLabelNode()
var goldMedal = SKSpriteNode()
var silverMedal = SKSpriteNode()
var bronzeMedal = SKSpriteNode()
var diamondMedal = SKSpriteNode()
var howToPlay = SKSpriteNode()

var amountOfExtraLivesLabel2 = SKLabelNode()


   



class StartScene: SKScene, AVAudioPlayerDelegate {
    
    
    

    override func didMove(to view: SKView) {
        
       
        
        let highscoreDefault = UserDefaults.standard
       // let extraLivesDefault = UserDefaults.standard
        
        
        
        if highscoreDefault.value(forKey: "highscore") != nil{
            Playerhighscore = highscoreDefault.value(forKey: "highscore") as! NSInteger
        }
        
        //if extraLivesDefault.value(forKey: "amountOfExtraLives") != nil{
          //  lives = extraLivesDefault.value(forKey: "amountOfExtraLives") as! NSInteger
        //}
        
        
        amountOfExtraLivesLabel2 = self.childNode(withName: "variableLabel2") as! SKLabelNode
        amountOfExtraLivesLabel2.text = "\(lives)"
        button = self.childNode(withName: "multiplayer") as! SKSpriteNode
        title = self.childNode(withName: "title") as! SKSpriteNode
        subtitle = self.childNode(withName: "tomasward") as! SKSpriteNode
        best = self.childNode(withName: "bestLabel") as! SKLabelNode
        goldMedal = self.childNode(withName: "medalGold") as! SKSpriteNode
        silverMedal = self.childNode(withName: "medalSilver") as! SKSpriteNode
        bronzeMedal = self.childNode(withName: "medalBronze") as! SKSpriteNode
        diamondMedal = self.childNode(withName: "diamondMedal") as! SKSpriteNode
        goldMedal.isHidden = true
        silverMedal.isHidden = true
        bronzeMedal.isHidden = true
        diamondMedal.isHidden = true
        howToPlay = self.childNode(withName: "howToPlay") as! SKSpriteNode
          best.text = "Best: \(Playerhighscore)"
        if Playerhighscore == 1 {
            
            best.text = "No Best"}
        let BokehPath = Bundle.main.path(forResource: "BackgroundBokeh",ofType: "sks")
        let bokehNode = NSKeyedUnarchiver.unarchiveObject(withFile: BokehPath!) as! SKEmitterNode
     
        bokehNode.position = CGPoint(x: 0, y: 0)
        bokehNode.targetNode = self
        
        self.addChild(bokehNode)
       
       
        
        highscoreDefault.set(Playerhighscore, forKey: "highscore")
        highscoreDefault.synchronize()
        
        
        
       // extraLivesDefault.set(lives, forKey: "amountOfExtraLives")
       // extraLivesDefault.synchronize()
        
        if Playerhighscore <= 80 && Playerhighscore > 65 {
            goldMedal.isHidden = false
        } else if Playerhighscore > 80 && Playerhighscore <= 100 {
            silverMedal.isHidden = false
        } else if Playerhighscore > 100 && Playerhighscore <= 150 {
            bronzeMedal.isHidden = false
        } else if Playerhighscore <= 65 && Playerhighscore > 1 {
            diamondMedal.isHidden = false
        } else if Playerhighscore == 10000 {
            best.isHidden = false
            best.text = "No Best"
        } else {
            silverMedal.isHidden = true
            goldMedal.isHidden = true
            bronzeMedal.isHidden = true
            diamondMedal.isHidden = true
        }
    }
    
    
   
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if howToPlay.contains(location){
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let HowToPlayScene = SKScene(fileNamed: "HowToPlay")
                let transition = SKTransition.crossFade(withDuration: 1)
                HowToPlayScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(HowToPlayScene!, transition: transition)
            }
            
            if button.contains(location){
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let GameScene = SKScene(fileNamed: "GameScene")
                let transition = SKTransition.crossFade(withDuration: 1)
                GameScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(GameScene!, transition: transition)
        
    }
        
}
}

    override func update(_ currentTime: TimeInterval) {
        if lives != 10 {
            amountOfExtraLivesLabel2.position = CGPoint(x: -175, y: 574)
        }
    }
   
    
    
    
}
