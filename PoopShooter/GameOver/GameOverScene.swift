//
//  GameOverScene.swift
//  SpaceShooter
//
//  Created by Seth Danner on 3/28/19.
//  Copyright © 2019 Seth Danner. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    
    // MARK: Properties
    var score: Int = 0
    var gameOverLabel: SKLabelNode!
    var scoreLabel: SKLabelNode!
    var scoreTotalLabel: SKLabelNode!
    var newGameButtonNode: SKSpriteNode!
    var difficultyButtonNode: SKSpriteNode!
    var difficultyLabelNode: SKLabelNode!
    var background = SKSpriteNode(imageNamed: "backgroundTile")
    
    override func didMove(to view: SKView) {
        
        background.zPosition = -1
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        addChild(background)
        
        self.run(SKAction.playSoundFileNamed("movedOffScreen.mp3", waitForCompletion: false))
        self.run(SKAction.playSoundFileNamed("gameOver.mp3", waitForCompletion: false))
        
        gameOverLabel = self.childNode(withName: "gameOverLabel") as! SKLabelNode
        gameOverLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 175)
        
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 235)
        
        scoreTotalLabel = self.childNode(withName: "scoreTotalLabel") as! SKLabelNode
        scoreTotalLabel.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 285)
        scoreTotalLabel.text = "\(score)"
        
        newGameButtonNode = self.childNode(withName: "startOverButton") as! SKSpriteNode
        newGameButtonNode.position = CGPoint(x: self.frame.size.width / 1.95, y: self.frame.size.height - 345)
        newGameButtonNode.texture = SKTexture(imageNamed: "startOverButton")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let node = self.nodes(at: location)
            
            if node[0].name == "startOverButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let menuScene = MenuScene(fileNamed: "MenuScene")!
                menuScene.scaleMode = .aspectFit
                self.view!.presentScene(menuScene, transition: transition)
            }
        }
    }
}
