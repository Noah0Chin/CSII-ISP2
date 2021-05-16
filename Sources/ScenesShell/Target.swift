import Scenes
import Foundation
import Igis

class Target: RenderableEntity, EntityMouseClickHandler {
    var didRender = false
    init() {
        super.init(name:"Target")
    }
    
    override func setup(canvasSize:Size, canvas:Canvas) {
        dispatcher.registerEntityMouseClickHandler(handler:self)
    }
    
    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }

    func onEntityMouseClick(globalLocation: Point) {
        didRender = false
    }
    
    override func render(canvas: Canvas) {
        let target = Ellipse(center:Point(x:50,y:50), radiusX:50, radiusY:55)
        let fillStyle = FillStyle(color:Color(.blueviolet))
        let strokeStyle = StrokeStyle(color:Color(.black))
        canvas.render(fillStyle, strokeStyle, target)
        
        didRender = true
    }
}
