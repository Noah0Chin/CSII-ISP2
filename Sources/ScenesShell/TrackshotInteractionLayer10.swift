import Scenes
import Igis
import Foundation
import ScenesControls

class TrackshotInteractionLayer10 : Layer {

    var target = TrackshotTarget(center:Point(x:960, y:500), radiusX: 25, radiusY: 25)
    let timer = Timer(enqueueScene:ScoreScene(), timeLimit:10)

    public init() {
        super.init(name: "Trackshot Interaction")
        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }
    
    func background() -> Background {
        guard let mainScene = scene as? TrackshotScene10 else {
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
