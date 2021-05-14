import Foundation
import Scenes
import Igis


// testing file change
class GunShot: RenderableEntity, EntityMouseClickHandler {

    // create gunshot audio
    let gunshotSound : Audio
    var playGunshotSound = false

    // create bullethole/ gunshot object.
    let gunshot : Image

    // TopLeft render point, this render point will render the gunshot
    var renderPoint = Point(x:0,y:0)

    // Frame Counter, a frame counter is used to keep track of time. IGIS runs at 30 fps. This frame counter in particular is used to track how long the bullet image and bounding rect is staying on the screen for
    var frameCounter = 0

    init() {

        // initilize the gunshot image URL
        guard let gunshotURL = URL(string:"https://i.imgur.com/dVcZ9IM.png") else {
            fatalError("Failed to create the URL for gunshot")
        }
        gunshot = Image(sourceURL:gunshotURL)

        guard let gunshotSoundURL = URL(string:"https://files.gamebanana.com/preview/sounds/usp1_8699f.mp3") else {
            fatalError("Failed to created the URL for gunshot Sound")
        }
        gunshotSound = Audio(sourceURL:gunshotSoundURL)

        // Using a meaningful name can be helpful for debugging
        super.init(name:"GunShot")
    }

    // tells igis to setup my image, setup a base render point for the image, and the dispatcher for the click handler
    override func setup(canvasSize:Size, canvas:Canvas) {
        renderPoint = canvasSize.center
        dispatcher.registerEntityMouseClickHandler(handler:self)
        canvas.setup(gunshot)
        canvas.setup(gunshotSound)
    }

    // teardown function, unregisters the click handler
    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)
    }

    // function for what happens on a mouse click
    func onEntityMouseClick(globalLocation: Point) {
        // change the renderpoint of the image, this allows the image to follow where you click
        renderPoint = Point(x:globalLocation.x - 17, y:globalLocation.y - 25)

        // print bang on console for bebugging the click handler
        print("bang")
        // this sets the frame counter to 0 when you click on the screen. This allows a gunshot image to be render again for 6 frames
        frameCounter = 0

        playGunshotSound = true
    }

    // creates a bounding rect for the CLICK HANDLER. this bounding rect tells us where our clicks will be registered. in this case, the whole canvas.
    override func boundingRect() -> Rect {
        return Rect(size: Size(width: Int.max, height: Int.max))
    }


    // render function which renders the gunshot image if ready
    override func render(canvas:Canvas) {

        // if statement for framecounter, this renders the gunshot for only 6 frames, then the image disapears
        if frameCounter <= 6 {
            if gunshot.isReady {
                // renders the gunshot based on the renderPoint
                gunshot.renderMode = .destinationRect(Rect(topLeft:renderPoint, size:Size(width:50, height:50)))
                canvas.render(gunshot)
            }
            // adds a frame everytime the gunshot is rendered for a frame (basically everytime this function is ran)
            frameCounter += 1
        }

        if gunshotSound.isReady && playGunshotSound == true{
            canvas.render(gunshotSound)
            print("played sound")
            //            isGunshotSoundPlaying = true
            playGunshotSound = !playGunshotSound
        }

    }



}
