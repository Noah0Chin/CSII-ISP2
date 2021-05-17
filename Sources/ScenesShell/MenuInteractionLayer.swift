import Scenes
import Igis
import ScenesControls


class MenuInteractionLayer : Layer {
    let gamesArray = [GridshotScene(), FlickshotScene(), TrackshotScene(), MassShotScene()]

    var canvasX = 0
    var canvasY = 0

    func setup(canvasSize:Size, canvas:Canvas) {
        canvasX = canvasSize.center.x
        canvasY = canvasSize.center.y        
    }
    
        
    init() {
        super.init(name:"Menu Interaction")
        

        /*createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:300, y:100),
                    layoutStyle:.uniformColumn) */
        
        SettableTimer().setTime(endTime:10)
        
        let startRandomButton = Button(name:"startRandom", labelString: "Random",
                                         topLeft: Point(x: 50, y: 25))
        startRandomButton.clickHandler = onStartRandomButtonClickHandler
        insert(entity: startRandomButton, at: .front)        

        
        let startGridshotButton = Button(name:"startGridshot", labelString: "Play Gridshot",
                                         topLeft: Point(x: 50, y: 100))
        startGridshotButton.clickHandler = onStartGridshotButtonClickHandler
        insert(entity: startGridshotButton, at: .front)

        let startFlickshotButton = Button(name:"startFlickshot", labelString: "Play Flickshot",
                                         topLeft: Point(x: 50, y: 150))
        startFlickshotButton.clickHandler = onStartFlickshotButtonClickHandler
        insert(entity: startFlickshotButton, at: .front)

        let startTrackshotButton = Button(name:"startTrackshot", labelString: "Play Trackshot",
                                         topLeft: Point(x: 50, y: 200))
        startTrackshotButton.clickHandler = onStartTrackshotButtonClickHandler
        insert(entity: startTrackshotButton, at: .front)

        let startMassShotButton = Button(name:"startMassShot", labelString: "Play MassShot",
                                         topLeft: Point(x: 50, y: 250))
        startMassShotButton.clickHandler = onStartMassShotButtonClickHandler
        insert(entity: startMassShotButton, at: .front)        
    }

    func createPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startGridshot10Button = Button(name:"startGridshot10", labelString: "10 seconds")
        let startGridshot30Button = Button(name:"startGridshot30", labelString: "30 seconds")
        
        panel.insert(owningLayer:self, entity:startGridshot10Button)
        panel.insert(owningLayer:self, entity:startGridshot30Button)

        startGridshot10Button.clickHandler = onStartGridshot10ButtonClickHandler
        startGridshot30Button.clickHandler = onStartGridshot30ButtonClickHandler
    }


    
    /*
    func createButton(name:String) -> String {
        let test = "private func onStart\(name)ButtonClickHandler(control: Control, localLocation: Point) {"
        return test
    }
    
    createButton(name:"TestGame")
     */
    
   
    private func onStartRandomButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:gamesArray.randomElement()!)
        director.transitionToNextScene()
        //createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:150, y:100), layoutStyle:.uniformColumn)
        
    }
    
    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {    
        //director.enqueueScene(scene:GridshotScene())
        //director.transitionToNextScene()
        createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:200, y:100), layoutStyle:.uniformColumn)        
    }

    private func onStartFlickshotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:FlickshotScene())
        director.transitionToNextScene()
    }

    private func onStartTrackshotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:TrackshotScene())
        director.transitionToNextScene()
    }

    private func onStartMassShotButtonClickHandler(control: Control, localLocation: Point) {
        director.enqueueScene(scene:MassShotScene())
        director.transitionToNextScene()
    }



    private func onStartGridshot10ButtonClickHandler(control: Control, localLocation: Point) {        
        director.enqueueScene(scene:GridshotScene())
        director.transitionToNextScene()
        SettableTimer().setTime(endTime:10)        
    }
    private func onStartGridshot30ButtonClickHandler(control: Control, localLocation: Point) {        
        director.enqueueScene(scene:GridshotScene())
        director.transitionToNextScene()
        SettableTimer().setTime(endTime:30)        
    }
    
    
}
