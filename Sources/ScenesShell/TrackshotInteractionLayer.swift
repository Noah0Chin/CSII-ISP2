import Scenes
import Igis
import Foundation
import ScenesControls

class TrackshotInteractionLayer : Layer {

    var target = TrackshotTarget(center:Point(x:960, y:500), radiusX: 25, radiusY: 25)
    let timer = Timer(enqueueScene:ScoreScene(), timeLimit:45)

    public init() {
        super.init(name: "Trackshot Interaction")
        insert(entity: target, at:.front)
        insert(entity: timer, at:.front)
    }
}
