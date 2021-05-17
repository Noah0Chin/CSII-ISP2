import Scenes
import Igis
import ScenesControls


class MenuInteractionLayer : Layer {
    var didRender = false

    let gamesArray = [GridshotScene(), WipeshotScene()]
    
    init() {
        super.init(name:"Menu Interaction")

        let startRandomButton = Button(name:"startRandom", labelString: "Random",
                                         topLeft: Point(x: 50, y: 25))
        startRandomButton.clickHandler = onStartRandomButtonClickHandler
        insert(entity: startRandomButton, at: .front)        
        
        let startGridshotButton = Button(name:"startGridshot", labelString: "Play Gridshot",
                                         topLeft: Point(x: 50, y: 100))
        startGridshotButton.clickHandler = onStartGridshotButtonClickHandler
        insert(entity: startGridshotButton, at: .front)

        let startWipeshotButton = Button(name:"startWipeshot", labelString: "Play Wipeshot",
                                         topLeft: Point(x: 50, y: 150))
        startWipeshotButton.clickHandler = onStartWipeshotButtonClickHandler
        insert(entity: startWipeshotButton, at: .front)

        let startTrackshotButton = Button(name:"startTrackshot", labelString: "Play Trackshot",
                                         topLeft: Point(x: 50, y: 200))
        startTrackshotButton.clickHandler = onStartTrackshotButtonClickHandler
        insert(entity: startTrackshotButton, at: .front)

    }

    func createButton(name:String) -> String {
        let test = "private func onStart\(name)ButtonClickHandler(control: Control, localLocation: Point) {"
        return test
    }
    
    //createButton(name:"TestGame")

    private func onStartRandomButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:gamesArray.randomElement()!)
        director.transitionToNextScene()
    }
    
    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {    
        director.enqueueScene(scene:GridshotScene())
        director.transitionToNextScene()
    }

    private func onStartWipeshotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:WipeshotScene())
        director.transitionToNextScene()
    }

    private func onStartTrackshotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:gamesArray.randomElement()!)
        director.transitionToNextScene()
    }

    
}
