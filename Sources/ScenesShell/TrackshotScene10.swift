import Scenes

/*
   This class is responsible for implementing a single Scene.
   Scenes projects require at least one Scene but may have many.
   A Scene is comprised of one or more Layers.
   Layers are generally added in the constructor.
 */
class TrackshotScene10 : Scene {

    /* Scenes typically include one or more Layers.
       A common approach is to use three Layers:
       One for the background, one for interaction,
       and one for the foreground.
     */
    
    let backgroundLayer = BackgroundLayer()
    let trackshotInteractionLayer10 = TrackshotInteractionLayer10()
        
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Trackshot Scene 10")

        // We insert our Layers in the constructor
        // We place each layer in front of the previous layer
        insert(layer:backgroundLayer, at:.back)
        insert(layer:trackshotInteractionLayer10, at:.inFrontOf(object:backgroundLayer))
    }
}
