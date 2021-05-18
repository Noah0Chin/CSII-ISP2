import Scenes
import Igis
import Foundation
import ScenesControls

class FlickshotInteractionLayer : Layer {
    var target = FlickshotTarget(center:Point(x:960, y:500), radiusX: 20, radiusY: 20)

    public var timeSet : Int?

    let timer = Timer(enqueueScene:ScoreScene(), timeLimit: 5)
    
    public init() {
        super.init(name: "Wipeshot Interaction")

        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }
        
    func background() -> Background {
        guard let mainScene = scene as? FlickshotScene else {
            fatalError("mainScene of type GridshotScene is required")
        }
        let backgroundLayer = mainScene.backgroundLayer
        let background = backgroundLayer.background
        return background
    }
    
    override func postCalculate(canvas: Canvas) {
        if timer.seconds == timer.endTimeLimit - 1 {
            background().noMusic()
        }
        
    } 
}
