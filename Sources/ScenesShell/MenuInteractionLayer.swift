import Scenes
import Igis
import ScenesControls


class MenuInteractionLayer : Layer {
    let gamesArray = [GridshotScene(), FlickshotScene(), TrackshotScene(), MassShotScene()]
    let games10Array = [GridshotScene10(), FlickshotScene10(), TrackshotScene10(), MassShotScene10()]    

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
        

        
        let startRandomButton = Button(name:"startRandom", labelString: "Random 45s",
                                         topLeft: Point(x: 50, y: 55))
        startRandomButton.clickHandler = onStartRandomButtonClickHandler
        insert(entity: startRandomButton, at: .front)        

        let startRandom10Button = Button(name:"startRandom10", labelString: "Random 10s",
                                         topLeft: Point(x: 50, y: 25))
        startRandom10Button.clickHandler = onStartRandom10ButtonClickHandler
        insert(entity: startRandom10Button, at: .front)        

        
        let startGamesButton = Button(name:"gamesRandom", labelString: "Games",
                                         topLeft: Point(x: 50, y: 120))
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
        let startGridshot45Button = Button(name:"startGridshot45", labelString: "45 seconds")
        
        panel.insert(owningLayer:self, entity:startGridshot10Button)
        panel.insert(owningLayer:self, entity:startGridshot45Button)

        startGridshot10Button.clickHandler = onStartGridshot10ButtonClickHandler
        startGridshot45Button.clickHandler = onStartGridshot45ButtonClickHandler

    }





    func flickshotPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startFlickshot10Button = Button(name:"startFlickshot10", labelString: "10 seconds")
        let startFlickshot45Button = Button(name:"startFlickshot45", labelString: "45 seconds")
        
        panel.insert(owningLayer:self, entity:startFlickshot10Button)
        panel.insert(owningLayer:self, entity:startFlickshot45Button)

        startFlickshot10Button.clickHandler = onStartFlickshot10ButtonClickHandler
        startFlickshot45Button.clickHandler = onStartFlickshot45ButtonClickHandler

    }

    func trackshotPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startTrackshot10Button = Button(name:"startTrackshot10", labelString: "10 seconds")
        let startTrackshot45Button = Button(name:"startTrackshot45", labelString: "45 seconds")
        
        panel.insert(owningLayer:self, entity:startTrackshot10Button)
        panel.insert(owningLayer:self, entity:startTrackshot45Button)

        startTrackshot10Button.clickHandler = onStartTrackshot10ButtonClickHandler
        startTrackshot45Button.clickHandler = onStartTrackshot45ButtonClickHandler

    }

    func massShotPanel(name:String, labelString:String, topLeft:Point, layoutStyle:Panel.LayoutStyle) {
        // Create and insert the panel into the LAYER
        let panel = Panel(name:name, topLeft:topLeft, layoutStyle:layoutStyle)
        insert(entity:panel, at:.front)

        let startMassShot10Button = Button(name:"startMassShot10", labelString: "10 seconds")
        let startMassShot45Button = Button(name:"startMassShot45", labelString: "45 seconds")
        
        panel.insert(owningLayer:self, entity:startMassShot10Button)
        panel.insert(owningLayer:self, entity:startMassShot45Button)

        startMassShot10Button.clickHandler = onStartMassShot10ButtonClickHandler
        startMassShot45Button.clickHandler = onStartMassShot45ButtonClickHandler

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

        let emptyButton4 = Button(name:"empty", labelString: " ")        
        panel.insert(owningLayer:self, entity:emptyButton4)
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

    /*
    func timerGridshot() -> Timer {
        guard let timerO = scene as? GridshotScene else { 
            fatalError("menuScene of type GridshotScene is required")
        }
        let backgroundLayer = timerO.gridshotInteractionLayer
        let timerGridshot = backgroundLayer.timer
        return timerGridshot
    }
    
        
    func timerFlickshot() -> Timer {
        guard let timerO = scene as? FlickshotScene else { 
            fatalError("menuScene of type FlickshotScene is required")
        }
        let backgroundLayer = timerO.flickshotInteractionLayer
        let timerFlickshot = backgroundLayer.timer
        return timerFlickshot
    }
    

        
    func timerMassShot() -> Timer {
        guard let timerO = scene as? MassShotScene else { 
            fatalError("menuScene of type MassShotScene is required")
        }
        let backgroundLayer = timerO.massShotInteractionLayer
        let timerMassShot = backgroundLayer.endGameTimer
        return timerMassShot
    }
    

        
    func timerTrackshot() -> Timer {
        guard let timerO = scene as? TrackshotScene else { 
            fatalError("menuScene of type FlickShotScene is required")
        }
        let backgroundLayer = timerO.trackshotInteractionLayer
        let timerTrackshot = backgroundLayer.timer
        return timerTrackshot
    }
      */
      



   
    private func onStartRandomButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:gamesArray.randomElement()!)
        director.transitionToNextScene()
        //createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:150, y:100), layoutStyle:.uniformColumn)        
    }
    private func onStartRandom10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:games10Array.randomElement()!)
        director.transitionToNextScene()
        //createPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:150, y:100), layoutStyle:.uniformColumn)        
    }

    
    let xPos = 50
    let yPos = 200
    private func onStartGamesButtonClickHandler(control: Control, localLocation: Point) {

        gamesPanel(name:"Horizontal", labelString:"Horizontal Panel", topLeft:Point(x:xPos, y:yPos), layoutStyle:.uniformRow)        
    }

    
    private func onStartGridshotButtonClickHandler(control: Control, localLocation: Point) {
        //original point is at 50, 200
        gridshotPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:xPos+160, y:yPos), layoutStyle:.uniformColumn)        
    }

    private func onStartFlickshotButtonClickHandler(control: Control, localLocation: Point) {
        flickshotPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:xPos+455, y:yPos), layoutStyle:.uniformColumn)                
    }

    private func onStartTrackshotButtonClickHandler(control: Control, localLocation: Point) {
        trackshotPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:xPos+750, y:yPos), layoutStyle:.uniformColumn)                        
    }

    private func onStartMassShotButtonClickHandler(control: Control, localLocation: Point) {
        massShotPanel(name:"Vertical", labelString:"Vertical Panel", topLeft:Point(x:xPos+1045, y:yPos), layoutStyle:.uniformColumn)                
    }



    private func onStartGridshot10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()     
        director.enqueueScene(scene:GridshotScene10())
        shouldTransition = true                    
    }
    private func onStartGridshot45ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:GridshotScene())
        shouldTransition = true                          
    }

    private func onStartFlickshot10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:FlickshotScene10())
        shouldTransition = true                    
    }
    private func onStartFlickshot45ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:FlickshotScene())
        shouldTransition = true                          
    }

    private func onStartTrackshot10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:TrackshotScene10())
        shouldTransition = true                    
    }
    private func onStartTrackshot45ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:TrackshotScene())
        shouldTransition = true                          
    }

    private func onStartMassShot10ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:MassShotScene10())
        shouldTransition = true                    
    }
    private func onStartMassShot45ButtonClickHandler(control: Control, localLocation: Point) {
        background().shouldMusicPlay()
        director.enqueueScene(scene:MassShotScene())
        shouldTransition = true                          
    }


    
    override func postCalculate(canvas: Canvas) {
        if shouldTransition {
            director.transitionToNextScene()
        }
    }
    
}
