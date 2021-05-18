import Scenes
import Igis
import Foundation
import ScenesControls

class GridshotInteractionLayer : Layer {

    var target = GridshotTarget(center:Point(x:960, y:500), radiusX: 20, radiusY: 20) // 960, 500


    public var timeSet : Int?
    
    //let timer = Timer(enqueueScene:ScoreScene(), timeLimit:45)

    var timer = Timer(enqueueScene:ScoreScene(),timeLimit:10)

    //let timer = Timer(enqueueScene:ScoreScene(), timeLimit:15)


    //var didRender = false
    
    public init() {
<<<<<<< HEAD
        super.init(name:"Gridshot Interaction")
        SettableTimer().setTime(endTime:45)
=======
>>>>>>> fdfa37683fa984fe566d2af854629946d300277d

        super.init(name:"Gridshot Interaction")
        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }
    
    func background() -> Background {
        guard let mainScene = scene as? GridshotScene else {
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
