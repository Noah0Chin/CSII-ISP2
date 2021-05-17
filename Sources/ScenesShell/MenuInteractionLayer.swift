import Scenes
import Igis
import ScenesControls


class MenuInteractionLayer : Layer {
    var didRender = false

    init() {
        super.init(name:"Menu Interaction")

        let startGridshotButton = Button(name:"startGridshot", labelString: "Play Gridshot",
                                         topLeft: Point(x: 50, y: 50))
        startGridshotButton.clickHandler = onStartGridshotButtonClickHandler
        insert(entity: startGridshotButton, at: .front)
        
    }
    /*
    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender{
            
            didRender = true
        } 
    }
    */

    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {    
        //ShellDirector().startGridshot()
        director.enqueueScene(scene:GridshotScene())
        director.transitionToNextScene()
    }
}
