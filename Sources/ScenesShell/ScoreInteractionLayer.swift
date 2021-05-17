import Scenes
import Igis
import ScenesControls

class ScoreInteractionLayer : Layer {

   
    init() {
        super.init(name:"Score Interaction Layer")
        let backToMainMenuButton = Button(name:"backToMainMenu", labelString: "To Main Menu?",
                                          topLeft: Point(x:1870 / 2 , y: 810 ))
        backToMainMenuButton.clickHandler = onBackToMainMenuButtonClickHandler
        
        insert(entity: backToMainMenuButton, at: .front)
    }
    

    private func onBackToMainMenuButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:MenuScene())
        director.transitionToNextScene()
    }
}
