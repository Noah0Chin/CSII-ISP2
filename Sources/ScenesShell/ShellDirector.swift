import Igis
import Scenes

/*
 This class is primarily responsible for transitioning between Scenes.
 At a minimum, it must enqueue the first Scene.
 */

// GridshotScene, MenuScene, MainScene

/*
 Information about the Director and how Scenes work:
 Scenes are constructed of different Layers.
 Layers are constructed of different RenderableEntitys, which are objects responsible for providing the rendering and interaction for a Layer.
 
 Director's first action is to enqueue a scene.
 The scene executes until transition method is invoked to 'transition' to the next scene. 
 */


/*
 Scenes: MenuScene, GridshotScene, etc. 
 */


class ShellDirector : Director {
    
    required init() {
        super.init()
        enqueueScene(scene:MenuScene())
    }

/*    func startGridshot() {
        enqueueScene(scene:GridshotScene())
        transitionToNextScene()
        print("Transitioned to Gridshot Scene")
    } */

    
/*    func startGridshot() {
        enqueueScene(scene:GridshotScene())
        transitionToNextScene()
        print("Start Gridshot Button Clicked")        
    } */
    
    
//    func startGridshot() {
  //  }
    
    
    // if MenuScene.swap() is true, then transition scene here. In menu, add button that makes swap function true when it is pressed
    // Below code is for transition to different game scenes.
    
    override func framesPerSecond() -> Int {
        return 30
    }

}


