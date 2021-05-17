import Scenes
import Igis
import Foundation
import ScenesControls

class FlickshotInteractionLayer : Layer {
    var target = FlickshotTarget(center:Point(x:960, y:500), radiusX: 20, radiusY: 20)

    public init() {
        super.init(name: "Wipeshot Interaction")

        insert(entity: target, at:.front)
    }
}
