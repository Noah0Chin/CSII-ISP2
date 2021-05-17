import Scenes
import Igis
import ScenesControls

class GridshotInteractionLayer : Layer {
   // var didRender = false
//    var xPosition : Int
  //  var yPosition : Int

    init() {
        super.init(name:"Gridshot Interaction")

        
        let getNewPositionButton = Button(name: "NewPosition", labelString: "New Position", topLeft: Point(x: 500, y:500))
        getNewPositionButton.clickHandler = getNewPositionButtonClickHandler
        insert(entity: getNewPositionButton, at: .front)
    }

    // Render the objects and potentially the canvas where the objects will spawn
/*    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender {
            
            // render one target
            
            didRender = true
        }
    }
*/
    func getNewPosition() {
    }

    func getNewPositionButtonClickHandler(control: Control, localLocation: Point) {
        getNewPosition()
    }
    
}



    
