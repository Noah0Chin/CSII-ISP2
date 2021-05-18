import Scenes
import Igis
import ScenesControls


class MenuInteractionLayer : Layer {
    let gamesArray = [GridshotScene(), FlickshotScene(), TrackshotScene(), MassShotScene()]

    var canvasX = 0
    var canvasY = 0
    var shouldTransition = false
    
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

        let startGamesButton = Button(name:"gamesRandom", labelString: "Games",
                                         topLeft: Point(x: 50, y: 100))
        startGamesButton.clickHandler = onStartGamesButtonClickHandler
        insert(entity: startGamesButton, at: .front)        
        
        /*
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
         */
    }

    func gridshotPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startGridshot10Button = Button(name:"startGridshot10", labelString: "10 seconds")
        let startGridshot30Button = Button(name:"startGridshot30", labelString: "30 seconds")
        
        panel.insert(owningLayer:self, entity:startGridshot10Button)
        panel.insert(owningLayer:self, entity:startGridshot30Button)

        startGridshot10Button.clickHandler = onStartGridshot10ButtonClickHandler
        startGridshot30Button.clickHandler = onStartGridshot30ButtonClickHandler
        background().shouldMusicPlay()
    }

    
    func gamesPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startGridshotButton = Button(name:"startGridshot", labelString: "Play Gridshot")
        panel.insert(owningLayer:self, entity:startGridshotButton)
        startGridshotButton.clickHandler = onStartGridshotButtonClickHandler
        
        let emptyButton = Button(name:"empty", labelString: " ")
        panel.insert(owningLayer:self, entity:emptyButton)
        
        let startFlickshotButton = Button(name:"startFlickshot", labelString: "Play Flickshot")
        panel.insert(owningLayer:self, entity:startFlickshotButton)
        startFlickshotButton.clickHandler = onStartFlickshotButtonClickHandler
        
        let emptyButton2 = Button(name:"empty", labelString: " ")        
        panel.insert(owningLayer:self, entity:emptyButton2)
        
        let startTrackshotButton = Button(name:"startTrackshot", labelString: "Play Trackshot")
        panel.insert(owningLayer:self, entity:startTrackshotButton)
        startTrackshotButton.clickHandler = onStartTrackshotButtonClickHandler

        let emptyButton3 = Button(name:"empty", labelString: " ")        
        panel.insert(owningLayer:self, entity:emptyButton3)
        
        let startMassShotButton = Button(name:"startMassShot", labelString: "Play MassShot")
        panel.insert(owningLayer:self, entity:startMassShotButton)
        startMassShotButton.clickHandler = onStartMassShotButtonClickHandler
    }

    
    /*
    func createButton(name:String) -> String {
        let test = "private func onStart\(name)ButtonClickHandler(control: Control, localLocation: Point) {"
        return test
    }
    
    createButton(name:"TestGame")
     */
    func background() -> MenuBackground {
        guard let menuScene = scene as? MenuScene else {
            fatalError("menuScene of type MenuScene is required")            
        }
        let backgroundLayer = menuScene.backgroundLayer
        let background = backgroundLayer.menuBackground
        return background
    }
    
    func timerOjbect() -> Timer {
        guard let timerO = scene as? FlickshotScene else { 
            fatalError("menuScene of type FlickshotScene is required")
        }
        let backgroundLayer = timerO.flickshotInteractionLayer
        let transmuttableTimer = backgroundLayer.timer
        return transmuttableTimer
    }
    
   
    private func onStartRandomButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:gamesArray.randomElement()!)
        director.transitionToNextScene()
        //createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:150, y:100), layoutStyle:.uniformColumn)        
    }

    private func onStartGamesButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        
        gamesPanel(name:"Horizontal", labelString:"Horizontal Panel", topLeft:Point(x:50, y:200), layoutStyle:.uniformRow)        
    }

    
    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {    
        //director.enqueueScene(scene:GridshotScene())
        //director.transitionToNextScene()
        gridshotPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:200, y:100), layoutStyle:.uniformColumn)        
    }

    private func onStartFlickshotButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:FlickshotScene())
        shouldTransition = true             
    }

    private func onStartTrackshotButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:TrackshotScene())
        shouldTransition = true                    
    }

    private func onStartMassShotButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:MassShotScene())
        shouldTransition = true                    

    }



    private func onStartGridshot10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:GridshotScene())
        shouldTransition = true                    
//        director.transitionToNextScene()
//        SettableTimer().setTime(endTime:10)
//        background().shouldMusicPlay()
    }
    private func onStartGridshot30ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:GridshotScene())
        shouldTransition = true                          
//        director.transitionToNextScene()
//        SettableTimer().setTime(endTime:30)
//        background().shouldMusicPlay()
    }
    
    override func postCalculate(canvas: Canvas) {
        if shouldTransition {
            director.transitionToNextScene()
        }
    }
    
}
