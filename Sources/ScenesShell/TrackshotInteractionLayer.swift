import Scenes
import Igis
import Foundation
import ScenesControls

class GridShotInteractionLayer : Layer {

    var target = GridshotTarget(center:Point(x:960, y:500), radiusX:20, radiusY: 20)
    let time = Timer(enqueueScene:ScoreScene(), timeLimit:20)

    public init() {
        super.init(name: "Trackshot Interaction")
        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }
}
