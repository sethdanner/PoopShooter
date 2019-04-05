//
//  HowToPlayScene.swift
//  PoopShooter
//
//  Created by Seth Danner on 4/4/19.
//  Copyright © 2019 Seth Danner. All rights reserved.
//

import SpriteKit

class HowToPlayScene: SKScene {
    
    var background = SKSpriteNode(imageNamed: "backgroundTile")
    var howToPlayTitleLabelNode: SKLabelNode!
    var menuButtonNode: SKSpriteNode!
    var howToPlayLabelNode: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        self.scaleMode = .aspectFill
        
        background.zPosition = -1
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
        
        howToPlayTitleLabelNode = self.childNode(withName: "howToPlayTitleLabel") as! SKLabelNode
        howToPlayTitleLabelNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 150)
        
        howToPlayLabelNode = self.childNode(withName: "howToPlayLabel") as! SKLabelNode
        howToPlayLabelNode.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 500)
        howToPlayLabelNode.text = "Don't let those pesky toilets, plungers, and toilet-paper rolls past you! Shoot them by aiming your 'Poop Shooter' at the bottom of the screen and tapping on the screen to shoot. To move your poop shooter, tilt your device left or right. If any item passes by you and off the screen you lose a life. Game starts with 3 lives as shown in the top right corner as '💩'."
        howToPlayLabelNode.fontSize = 22
        howToPlayLabelNode.numberOfLines = 0
        howToPlayLabelNode.preferredMaxLayoutWidth = 320
        
        menuButtonNode = self.childNode(withName: "backToMenuButton") as! SKSpriteNode
        menuButtonNode.position = CGPoint(x: self.frame.size.width / 1.95, y: self.frame.size.height - 600)
        menuButtonNode.texture = SKTexture(imageNamed: "menuButton")
        
        howToPlayLabelNode = self.childNode(withName: "howToPlayLabel") as! SKLabelNode
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let node = self.nodes(at: location)
            
            if node[0].name == "backToMenuButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let menuScene = SKScene(fileNamed: "MenuScene") as! MenuScene
                menuScene.scaleMode = .aspectFill
                self.view!.presentScene(menuScene, transition: transition)
            }
        }
    }
}
