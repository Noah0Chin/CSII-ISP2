import Scenes
import Igis
import Foundation
import ScenesControls

class GridshotInteractionLayer : Layer {

    var target = GridshotTarget(center:Point(x:960, y:500), radiusX: 20, radiusY: 20) // 960, 500


    public var timeSet : Int?
    
    //let timer = Timer(enqueueScene:ScoreScene(), timeLimit:45)


    let timer = SettableTimer()

    //let timer = Timer(enqueueScene:ScoreScene(), timeLimit:15)


    //var didRender = false
    
    public init() {
        super.init(name:"Gridshot Interaction")
        SettableTimer().setTime(endTime:10)

        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
        print(SettableTimer().endTimeLimit)
    }

}
