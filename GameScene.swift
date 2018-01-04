//
//  GameScene.swift
//  TapWars MultiPlayer
//
//  Created by Tomas Ward on 10/10/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation
import AudioToolbox



var timerLabel = SKLabelNode()
var timer = Timer()

var extraLifeUsed = 0
var timeToPlay = 0

var lives = 10
var amountOfExtraLivesLabel = SKLabelNode()


var car = SKSpriteNode()
var finishLine = SKSpriteNode()
var tapToPlay = SKSpriteNode()
var tapToContinue = SKSpriteNode()
var circle = SKSpriteNode()
var circle2 = SKSpriteNode()
var circle3 = SKSpriteNode()
var circle4 = SKSpriteNode()
var circle5 = SKSpriteNode()
var circle6 = SKSpriteNode()
var circle7 = SKSpriteNode()
var circle8 = SKSpriteNode()
var spike = SKSpriteNode()
var spike2 = SKSpriteNode()
var spike3 = SKSpriteNode()
var spike4 = SKSpriteNode()
var spike5 = SKSpriteNode()
var spike6 = SKSpriteNode()
var spike7 = SKSpriteNode()
var spike8 = SKSpriteNode()
var heartSavior = SKSpriteNode()
var cancelLabel = SKLabelNode()
var extraLifeLabel = SKLabelNode()
var extraLifeButton = SKSpriteNode()
var cancelButton = SKSpriteNode()
var blurActivated = false

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        
      
        
        blurActivated = false
        amountOfExtraLivesLabel = self.childNode(withName: "variableLabel") as! SKLabelNode
        amountOfExtraLivesLabel.text = "\(lives)"
        
       
        finishLine = self.childNode(withName: "finishLine") as! SKSpriteNode
        circle = self.childNode(withName: "circle") as! SKSpriteNode
        circle2 = self.childNode(withName: "circle2") as! SKSpriteNode
        circle3 = self.childNode(withName: "circle3") as! SKSpriteNode
        circle4 = self.childNode(withName: "circle4") as! SKSpriteNode
        circle5 = self.childNode(withName: "circle5") as! SKSpriteNode
        circle6 = self.childNode(withName: "circle6") as! SKSpriteNode
        circle7 = self.childNode(withName: "circle7") as! SKSpriteNode
        circle8 = self.childNode(withName: "circle8") as! SKSpriteNode
        spike = self.childNode(withName: "spike") as! SKSpriteNode
        spike2 = self.childNode(withName: "spike2") as! SKSpriteNode
        spike3 = self.childNode(withName: "spike3") as! SKSpriteNode
        spike4 = self.childNode(withName: "spike4") as! SKSpriteNode
        spike5 = self.childNode(withName: "spike5") as! SKSpriteNode
        spike6 = self.childNode(withName: "spike6") as! SKSpriteNode
        spike7 = self.childNode(withName: "spike7") as! SKSpriteNode
        spike8 = self.childNode(withName: "spike8") as! SKSpriteNode
        tapToContinue = self.childNode(withName: "tapToContinue") as! SKSpriteNode
        tapToContinue.isHidden = true
        heartSavior = self.childNode(withName: "heartSavior") as! SKSpriteNode
        heartSavior.isHidden = true
        heartSavior.zPosition = 4
        cancelButton = self.childNode(withName: "cancelButton") as! SKSpriteNode
        cancelButton.isHidden = true
        cancelButton.zPosition = 3
        extraLifeButton = self.childNode(withName: "extraLifeButton") as! SKSpriteNode
        extraLifeButton.isHidden = true
        extraLifeButton.zPosition = 3
        cancelLabel = self.childNode(withName: "cancelLabel") as! SKLabelNode
        cancelLabel.isHidden = true
        cancelLabel.zPosition = 4
        extraLifeLabel = self.childNode(withName: "extraLifeLabel") as! SKLabelNode
        extraLifeLabel.isHidden = true
        extraLifeLabel.zPosition = 4

        car = self.childNode(withName: "car") as! SKSpriteNode
        
        let RocketPath = Bundle.main.path(forResource: "RocketTrail",ofType: "sks")
        let trailNode = NSKeyedUnarchiver.unarchiveObject(withFile: RocketPath!)
            as! SKEmitterNode
        let trailPosition = CGPoint(x: car.position.x, y: car.position.y - 200)
        trailNode.position = trailPosition
        trailNode.targetNode = self
        trailNode.particleBirthRate = 25
        trailNode.advanceSimulationTime(1)
        car.addChild(trailNode)
        
        tapToPlay = self.childNode(withName: "tapToPlay") as! SKSpriteNode
        timerLabel = self.childNode(withName: "timerLabel") as! SKLabelNode
        timeToPlay = 0
       
        extraLifeUsed = 0
        tapToPlay.isHidden = false
        circle.isHidden = false
        circle2.isHidden = true
        circle3.isHidden = true
        circle4.isHidden = false
        circle5.isHidden = true
        circle6.isHidden = true
        circle7.isHidden = false
        circle8.isHidden = true
        
        if circle.isHidden == true{
            spike.isHidden = false
        } else {
            spike.isHidden = true
        }
        
        if circle2.isHidden == true{
            spike2.isHidden = false
        } else {
            spike2.isHidden = true
        }
        
        if circle3.isHidden == true{
            spike3.isHidden = false
        } else {
            spike3.isHidden = true
        }
        
        if circle4.isHidden == true{
            spike4.isHidden = false
        } else {
            spike4.isHidden = true
        }
        
        if circle5.isHidden == true{
            spike5.isHidden = false
        } else {
            spike5.isHidden = true
        }
        
        if circle6.isHidden == true{
            spike6.isHidden = false
        } else {
            spike6.isHidden = true
        }
        
        if circle7.isHidden == true{
            spike7.isHidden = false
        } else {
            spike7.isHidden = true
        }
        if circle8.isHidden == true{
            spike8.isHidden = false
        } else {
            spike8.isHidden = true
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(lessTimeToPlay), userInfo: nil, repeats: true)
        
      
        
       
        
        
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tapToPlay.isHidden = true
      
       
        
        for touch in touches{
         
            let touchLocation = touch.location(in: self)
            let fireworkPath = Bundle.main.path(forResource: "Firework",ofType: "sks")
            
            let fireworkNode = NSKeyedUnarchiver.unarchiveObject(withFile: fireworkPath!)
                as! SKEmitterNode
            
         fireworkNode.position = touchLocation
            fireworkNode.zPosition = 5
            fireworkNode.targetNode = self
            self.addChild(fireworkNode)
            
            if extraLifeLabel.contains(touchLocation) && extraLifeLabel.isHidden == false {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                generator.impactOccurred()
                lives -= 1
                amountOfExtraLivesLabel.text = "\(lives)"
               
                blurActivated = false
                extraLifeUsed = 1
                tapToContinue.isHidden = false
                cancelButton.isHidden = true
                cancelLabel.isHidden = true
                extraLifeButton.isHidden = true
                extraLifeLabel.isHidden = true
                heartSavior.isHidden = true
                 timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(lessTimeToPlay), userInfo: nil, repeats: true)
                
            }
            
            if extraLifeButton.contains(touchLocation) && extraLifeButton.isHidden == false {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                lives -= 1
                
                amountOfExtraLivesLabel.text = "\(lives)"
               
                generator.impactOccurred()
                blurActivated = false
                extraLifeUsed = 1
                tapToContinue.isHidden = false
                cancelButton.isHidden = true
                cancelLabel.isHidden = true
                extraLifeButton.isHidden = true
                extraLifeLabel.isHidden = true
                heartSavior.isHidden = true
                 timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(lessTimeToPlay), userInfo: nil, repeats: true)
            }
            
            if cancelLabel.contains(touchLocation) && cancelLabel.isHidden == false {
                
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
                
            }
            
            if cancelButton.contains(touchLocation) && cancelButton.isHidden == false {
              
                timeToPlay = 10000
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.prepare()
                
                generator.impactOccurred()
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
            }
            
            
            if spike.contains(touchLocation) && spike.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                
                
            } else if spike.contains(touchLocation) && spike.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true{
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000                
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                
                scene!.view!.presentScene(RestartScene!, transition: transition)
             timer.invalidate()
                
                
            }
            
            
            if spike2.contains(touchLocation) && spike2.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
              
                
            } else if spike2.contains(touchLocation) && spike2.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
                timer.invalidate()
                
            }
            
            if spike3.contains(touchLocation) && spike3.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
               
                
            } else if spike3.contains(touchLocation) && spike3.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
               timer.invalidate()
                
            }
            
            if spike4.contains(touchLocation) && spike4.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
               
                
            } else if spike4.contains(touchLocation) && spike4.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
                timer.invalidate()
                
            }
            if spike5.contains(touchLocation) && spike5.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
                
                
            } else if spike5.contains(touchLocation) && spike5.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
               timer.invalidate()
                
            }
            if spike6.contains(touchLocation) && spike6.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
                
                
            } else if spike6.contains(touchLocation) && spike6.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
               timer.invalidate()
                
            }
            if spike7.contains(touchLocation) && spike7.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
              
                
            } else if spike7.contains(touchLocation) && spike7.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
               timer.invalidate()
                
            }
            if spike8.contains(touchLocation) && spike8.isHidden == false && blurActivated != true && extraLifeUsed == 0 {
                blurActivated = true
                cancelButton.isHidden = false
                cancelLabel.isHidden = false
                extraLifeButton.isHidden = false
                extraLifeLabel.isHidden = false
                heartSavior.isHidden = false
                timerLabel.isHidden = false
                timer.invalidate()
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.warning)
              
                
            } else if spike8.contains(touchLocation) && spike8.isHidden == false && blurActivated != true && extraLifeUsed == 1 && extraLifeButton.isHidden == true && extraLifeLabel.isHidden == true && cancelLabel.isHidden == true && cancelButton.isHidden == true && tapToContinue.isHidden == true {
                let generator2 = UINotificationFeedbackGenerator()
                generator2.prepare()
                generator2.notificationOccurred(.error)
                timerLabel.isHidden = true
                timeToPlay = 10000
                let RestartScene = SKScene(fileNamed: "RestartScene")
                let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
                RestartScene?.scaleMode = .aspectFit
                scene!.view!.presentScene(RestartScene!, transition: transition)
                timer.invalidate()
                
            }
            
if circle.contains(touchLocation) && blurActivated != true {
    
  
    
    if circle.isHidden == false && blurActivated != true {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        generator.impactOccurred()
        
        
    circle.isHidden = true
        spike.isHidden = false
   tapToContinue.isHidden = true
    if circle2.isHidden == false {
        circle3.isHidden = false
        spike3.isHidden = true
    }
         circle2.isHidden = false
        spike2.isHidden = true
    }
}
        
else if circle2.contains(touchLocation) && blurActivated != true  {
   
    if circle2.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle2.isHidden = true
        spike2.isHidden = false
    tapToContinue.isHidden = true
    if circle3.isHidden == false {
        circle4.isHidden = false
        spike4.isHidden = true
    }
        circle3.isHidden = false
        spike3.isHidden = true
    }
}
            
else if circle3.contains(touchLocation) && blurActivated != true {
    if circle3.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle3.isHidden = true
    spike3.isHidden = false
    tapToContinue.isHidden = true
    if circle4.isHidden == false {
        circle5.isHidden = false
        spike5.isHidden = true
    }
        circle4.isHidden = false
        spike4.isHidden = true
    }
}

else if circle4.contains(touchLocation) && blurActivated != true {
    
    if circle4.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle4.isHidden = true
        spike4.isHidden = false
    tapToContinue.isHidden = true
    if circle5.isHidden == false {
        circle6.isHidden = false
        spike6.isHidden = true
    }
        circle5.isHidden = false
        spike5.isHidden = true
    }
}

else if circle5.contains(touchLocation) && blurActivated != true {
    if circle5.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle5.isHidden = true
        spike5.isHidden = false
   tapToContinue.isHidden = true
    if circle6.isHidden == false {
        circle7.isHidden = false
        spike7.isHidden = true
    }
         circle6.isHidden = false
        spike6.isHidden = true
    }
}

else if circle6.contains(touchLocation) && blurActivated != true {
    if circle6.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle6.isHidden = true
        spike6.isHidden = false
    tapToContinue.isHidden = true
    if circle7.isHidden == false {
        circle8.isHidden = false
        spike8.isHidden = true
    }
        circle7.isHidden = false
        spike7.isHidden = true
    }
}

else if circle7.contains(touchLocation) && blurActivated != true {
    if circle7.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle7.isHidden = true
        spike7.isHidden = false
 tapToContinue.isHidden = true
    if circle8.isHidden == false {
        circle.isHidden = false
        spike.isHidden = true
    }
           circle8.isHidden = false
        spike8.isHidden = true
    }
}

else if circle8.contains(touchLocation) && blurActivated != true {
    if circle8.isHidden == false {
        car.position.y += 20
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        generator.impactOccurred()
    circle8.isHidden = true
        spike8.isHidden = false
    tapToContinue.isHidden = true
    if circle.isHidden == false {
        circle2.isHidden = false
        spike2.isHidden = true
    }
        circle.isHidden = false
        spike.isHidden = true
            }
}
        }}

    @objc func lessTimeToPlay() {
        if tapToPlay.isHidden == true && tapToContinue.isHidden == true {
        timeToPlay += 1
        
        timerLabel.text = "\(timeToPlay)"
        }
    }
    
   
    
    
    override func update(_ currentTime: TimeInterval) {
        if lives != 10 {
            amountOfExtraLivesLabel.position = CGPoint(x: -175, y: 574)
        }
     
        
    
        
        
        if circle.isHidden == false && circle2.isHidden == false && circle3.isHidden == true && circle4.isHidden == true && circle5.isHidden == true && circle6.isHidden == true && circle7.isHidden == true && circle8.isHidden == true {
            circle6.isHidden = false
            spike6.isHidden = true
        }
        if circle2.isHidden == false && circle3.isHidden == false && circle.isHidden == true && circle4.isHidden == true && circle5.isHidden == true && circle6.isHidden == true && circle7.isHidden == true && circle8.isHidden == true {
            circle7.isHidden = false
            spike7.isHidden = true
        }
        if circle3.isHidden == false && circle4.isHidden == false && circle.isHidden == true && circle2.isHidden == true && circle5.isHidden == true && circle6.isHidden == true && circle7.isHidden == true && circle8.isHidden == true {
            circle7.isHidden = false
            spike7.isHidden = true
        }
        if circle4.isHidden == false && circle5.isHidden == false && circle.isHidden == true && circle2.isHidden == true && circle3.isHidden == true && circle6.isHidden == true && circle7.isHidden == true && circle8.isHidden == true {
            circle8.isHidden = false
            spike8.isHidden = true
        }
        if circle5.isHidden == false && circle6.isHidden == false && circle.isHidden == true && circle2.isHidden == true && circle3.isHidden == true && circle4.isHidden == true && circle7.isHidden == true && circle8.isHidden == true {
            circle2.isHidden = false
            spike2.isHidden = true
        }
        if circle6.isHidden == false && circle7.isHidden == false && circle.isHidden == true && circle2.isHidden == true && circle3.isHidden == true && circle4.isHidden == true && circle5.isHidden == true && circle8.isHidden == true {
            circle3.isHidden = false
            spike3.isHidden = true
        }
        if circle7.isHidden == false && circle8.isHidden == false && circle3.isHidden == true && circle4.isHidden == true && circle5.isHidden == true && circle6.isHidden == true && circle.isHidden == true && circle2.isHidden == true {
            circle4.isHidden = false
            spike4.isHidden = true
        }
        if circle8.isHidden == false && circle.isHidden == false && circle3.isHidden == true && circle4.isHidden == true && circle5.isHidden == true && circle6.isHidden == true && circle7.isHidden == true && circle2.isHidden == true {
            circle5.isHidden = false
            spike5.isHidden = true
        }
        
        if car.position.y >= finishLine.position.y {
               timer.invalidate()
            let generator2 = UINotificationFeedbackGenerator()
            generator2.prepare()
            generator2.notificationOccurred(.success)
               car.removeFromParent()
            let RestartScene = SKScene(fileNamed: "RestartScene")
            let transition = SKTransition.doorsCloseVertical(withDuration: 0.75)
            RestartScene?.scaleMode = .aspectFit
            scene!.view!.presentScene(RestartScene!, transition: transition)
            
     
          
            
        
}
        
    
}
}
