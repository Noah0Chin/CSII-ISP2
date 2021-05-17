import Scenes
import Igis
import Foundation
import ScenesControls

class GridshotInteractionLayer : Layer {

    var target = Target(center:Point(x:960, y:500), radiusX: 20, radiusY: 20)
    var didRender = false
    
    public init() {
        super.init(name:"Gridshot Interaction")
        insert(entity: target, at:.front)       
    }

    // Sets random coordinates for a target
    public func delineateTarget() {

        let xPosition = Int.random(in: 200 ..< 1720)
        let yPosition = Int.random(in: 200 ..< 880)

        target = Target(center:Point(x:xPosition, y:yPosition), radiusX: 20, radiusY: 20)
    }

    // Verifies and inserts a target when the previous target is destroyed
    public func spawnTarget() {
        
        delineateTarget()
        insert(entity: target, at:.front)        
    }

    
    
}
