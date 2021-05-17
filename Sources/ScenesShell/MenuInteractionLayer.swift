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

        let startWipeshotButton = Button(name:"startWipeshot", labelString: "Play Wipeshot",
                                         topLeft: Point(x: 50, y: 100))
        startWipeshotButton.clickHandler = onStartWipeshotButtonClickHandler
        insert(entity: startWipeshotButton, at: .front)        
    }

    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {    
        //ShellDirector().startGridshot()
        director.enqueueScene(scene:GridshotScene())
        director.transitionToNextScene()
    }

    private func onStartWipeshotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:WipeshotScene())
        director.transitionToNextScene()
    }
}
