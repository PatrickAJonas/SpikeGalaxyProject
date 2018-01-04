//
//  RestartScene.swift
//  TapWars MultiPlayer
//
//  Created by Tomas Ward on 10/23/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit


var highscore = SKLabelNode()
var score = SKLabelNode()
var homeButton = SKSpriteNode()
var restartButton = SKSpriteNode()
var Playerhighscore = 1

var touchedSpike = SKSpriteNode()
var redLine = SKSpriteNode()
var galaxyBackground = SKSpriteNode()
var amountOfExtraLivesLabel3 = SKLabelNode()



class RestartScene: SKScene {
    
    
    
    override func didMove(to view: SKView) {
    
        let highscoreDefault = UserDefaults.standard
        if highscoreDefault.value(forKey: "highscore") != nil{
        Playerhighscore = highscoreDefault.value(forKey: "highscore") as! NSInteger
            
        }
       // let extraLivesDefault = UserDefaults.standard
        
       // if extraLivesDefault.value(forKey: "amountOfExtraLives") != nil{
         //   lives = extraLivesDefault.value(forKey: "amountOfExtraLives") as! NSInteger
      //  }
        
        
        highscore = self.childNode(withName: "highscore") as! SKLabelNode
        galaxyBackground = self.childNode(withName: "galaxyBackground") as! SKSpriteNode
        galaxyBackground.position = CGPoint(x: 0, y: 0)
        
        amountOfExtraLivesLabel3 = self.childNode(withName: "variableLabel3") as! SKLabelNode
        amountOfExtraLivesLabel3.text = "\(lives)"
        
        
       
        restartButton = self.childNode(withName: "restartButton") as! SKSpriteNode
        homeButton = self.childNode(withName: "homeButton") as! SKSpriteNode
        score = self.childNode(withName: "score") as! SKLabelNode
        score.text = "Score: \(timeToPlay)"
        touchedSpike = self.childNode(withName: "touchedASpike") as! SKSpriteNode
        redLine = self.childNode(withName: "redLine") as! SKSpriteNode
        redLine.isHidden = true
        touchedSpike.isHidden = true
        let SnowPath = Bundle.main.path(forResource: "BackgroundSnow",ofType: "sks")
        let SnowNode = NSKeyedUnarchiver.unarchiveObject(withFile: SnowPath!) as! SKEmitterNode
        
        SnowNode.position = CGPoint(x: 0, y: 680)
        SnowNode.targetNode = self
        SnowNode.advanceSimulationTime(1)
        
      
        
        let SnowPath2 = Bundle.main.path(forResource: "BackgroundSnow2",ofType: "sks")
        let SnowNode2 = NSKeyedUnarchiver.unarchiveObject(withFile: SnowPath2!) as! SKEmitterNode
        
        SnowNode2.position = CGPoint(x: 0, y: 680)
        SnowNode2.targetNode = self
        SnowNode2.advanceSimulationTime(1)
        
        

        if timeToPlay == 10000 {
        score.isHidden = true
        touchedSpike.isHidden = false
            redLine.isHidden = false
        highscore.isHidden = true
        touchedSpike.position = CGPoint(x: 5, y: 62)
            redLine.position = CGPoint(x: 5, y: 62)
        }
        
      
        
        if timeToPlay < Playerhighscore {
            Playerhighscore = timeToPlay
            highscore.text = "Best: \(Playerhighscore)"
            self.addChild(SnowNode)
        } else if Playerhighscore == 1 && timeToPlay == 10000 {
            Playerhighscore = timeToPlay
            highscore.isHidden = true
            touchedSpike.position = CGPoint(x: 0, y: 62)
            self.addChild(SnowNode2)
        } else if Playerhighscore == 1 && timeToPlay != 10000{
             Playerhighscore = timeToPlay
            highscore.text = "Best: \(Playerhighscore)"
            self.addChild(SnowNode)
        } else if timeToPlay >= Playerhighscore{
            highscore.text = "Best: \(Playerhighscore)"
            self.addChild(SnowNode2)
        }
        
       
        highscoreDefault.set(Playerhighscore, forKey: "highscore")
        highscoreDefault.synchronize()
        
       // extraLivesDefault.set(lives, forKey: "amountOfExtraLives")
        //extraLivesDefault.synchronize()
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
          let location = touch.location(in: self)
           
            if homeButton.contains(location){
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let StartScene = SKScene(fileNamed: "StartScene")
                let transition = SKTransition.fade(withDuration: 0.75)
                StartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(StartScene!, transition: transition)
            }
            else if restartButton.contains(location){
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let GameScene = SKScene(fileNamed: "GameScene")
                let transition = SKTransition.fade(withDuration: 0.75)
                GameScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(GameScene!, transition: transition)
            }
        }
    }
}
