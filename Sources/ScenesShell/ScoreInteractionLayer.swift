import Scenes
import Igis
import ScenesControls

class ScoreInteractionLayer : Layer {

    var transitionScene = false
    init() {
        super.init(name:"Score Interaction Layer")
        let backToMainMenuButton = Button(name:"backToMainMenu", labelString: "To Main Menu?",
                                          topLeft: Point(x:1870 / 2 , y: 810 ))
        backToMainMenuButton.clickHandler = onBackToMainMenuButtonClickHandler
        
        insert(entity: backToMainMenuButton, at: .front)
    }
    
    func background() -> ScoreBackground {
        guard let menuScene = scene as? ScoreScene else {
            fatalError("menuScene of type ScoreScene is required")            
        }
        let backgroundLayer = menuScene.scoreBackgroundLayer
        let background = backgroundLayer.background
        return background
    }

    private func onBackToMainMenuButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:MenuScene())
        background().noMusic()
        transitionScene = true
    }

    override func postCalculate(canvas: Canvas) {
        if transitionScene == true {
            director.transitionToNextScene()
            }
    }
}
