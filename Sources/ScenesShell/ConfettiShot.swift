import Foundation
import Scenes
import Igis



class ConfettiShot: RenderableEntity, EntityMouseClickHandler {

    // create confettishot audio
    let confettishotSound : Audio
    var playConfettishotSound = false
    let confettishotSoundTwo : Audio
    var alternateSound = false
    // create bullethole/ confettishot object.
    let confettishot : Image

    // TopLeft render point, this render point will render the confettishot
    var renderPoint = Point(x:0,y:0)

    // Frame Counter, a frame counter is used to keep track of time. IGIS runs at 30 fps. This frame counter in particular is used to track how long the bullet image and bounding rect is staying on the screen for
    var frameCounter = 0

    init() {

        // initilize the confettishot image URL
        guard let confettishotURL = URL(string:"https://cdn4.iconfinder.com/data/icons/event-entertainment-color/71/Celebration_cracker_confetti_party-512.png") else {
            fatalError("Failed to create the URL for confettishot")
        }
        confettishot = Image(sourceURL:confettishotURL)

        guard let confettishotSoundURL = URL(string:"https://bigsoundbank.com/UPLOAD/mp3/1554.mp3") else {
            fatalError("Failed to created the URL for confettishot Sound")
        }
        confettishotSound = Audio(sourceURL:confettishotSoundURL)

        guard let confettishotSoundTwoURL = URL(string:"https://bigsoundbank.com/UPLOAD/mp3/1555.mp3") else {
            fatalError("Failed to create URL for confetti shot sound 2")
        }
        confettishotSoundTwo = Audio(sourceURL:confettishotSoundTwoURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"ConfettiShot")
    }

    // tells igis to setup my image, setup a base render point for the image, and the dispatcher for the click handler
    override func setup(canvasSize:Size, canvas:Canvas) {
        renderPoint = canvasSize.center
        dispatcher.registerEntityMouseClickHandler(handler:self)
        canvas.setup(confettishot)
        canvas.setup(confettishotSound)
        canvas.setup(confettishotSoundTwo)
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
        // this sets the frame counter to 0 when you click on the screen. This allows a confettishot image to be render again for 6 frames
        frameCounter = 0

        playConfettishotSound = true
    }

    // creates a bounding rect for the CLICK HANDLER. this bounding rect tells us where our clicks will be registered. in this case, the whole canvas.
    override func boundingRect() -> Rect {
        return Rect(size: Size(width: Int.max, height: Int.max))
    }


    // render function which renders the confettishot image if ready
    override func render(canvas:Canvas) {

        // if statement for framecounter, this renders the confettishot for only 6 frames, then the image disapears
        if frameCounter <= 6 {
            if confettishot.isReady {
                // renders the confettishot based on the renderPoint
                confettishot.renderMode = .destinationRect(Rect(topLeft:renderPoint, size:Size(width:50, height:50)))
                canvas.render(confettishot)
            }
            // adds a frame everytime the confettishot is rendered for a frame (basically everytime this function is ran)
            frameCounter += 1
        }

        if confettishotSound.isReady && playConfettishotSound && alternateSound == false{
            canvas.render(confettishotSound)
            print("YAY")
            playConfettishotSound = !playConfettishotSound
            alternateSound = !alternateSound
        } else if confettishotSoundTwo.isReady && playConfettishotSound && alternateSound {
            canvas.render(confettishotSoundTwo)
            print("YAY2")
            playConfettishotSound = !playConfettishotSound
            alternateSound = !alternateSound
        }

    }



}
