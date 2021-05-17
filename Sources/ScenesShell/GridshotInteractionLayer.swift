import Scenes
import Igis
import Foundation
import ScenesControls

class GridshotInteractionLayer : Layer {

    var target = GridshotTarget(center:Point(x:960, y:500), radiusX: 20, radiusY: 20) // 960, 500

    public var timeSet : Int?
    
    let timer = Timer(enqueueScene:ScoreScene(), timeLimit:45)

    //var didRender = false
    
    public init() {
        super.init(name:"Gridshot Interaction")

        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }

}
