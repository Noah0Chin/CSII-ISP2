import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class ScoreBackground : RenderableEntity {

    var didRender = false

    let congratsBackground : Image
    let ggBackground : Image
    let memeBackground : Image
    
    init() {

        guard let congratsBackgroundURL = URL(string:"https://wallpaperaccess.com/full/3295969.jpg") else {
            fatalError("Failed to create the URL for congratsBackground")
        }
        congratsBackground = Image(sourceURL:congratsBackgroundURL)

        guard let ggBackgroundURL = URL(string:"https://i.pinimg.com/originals/7e/df/e0/7edfe0ce3e5887b8982bb887f3fcb06b.jpg") else {
            fatalError("Failed to create the URL for ggBackground")
        }

        ggBackground = Image(sourceURL:ggBackgroundURL)

        guard let memeBackgroundURL = URL(string:"https://cutewallpaper.org/21/beautiful-fantasy-backgrounds/Fantasy-Art-Backgrounds-79-images.jpg") else {
            fatalError("Failed to create the URL for memeBackground")
        }
        memeBackground = Image(sourceURL:memeBackgroundURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"ScoreBackground")
    }

    override func setup(canvasSize: Size, canvas:Canvas) {
        canvas.setup(ggBackground)
        canvas.setup(congratsBackground)
        canvas.setup(memeBackground)
    }


    let backgroundRandomizer = Int.random(in: 1...69)
    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender {
            // Clear the entire canvas
            let clearRect = Rect(topLeft: Point(x:0,y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
        }



        switch backgroundRandomizer {
        case 1 ..< 34 :
            if memeBackground.isReady {
                memeBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(memeBackground)
            }
        case 34 ... 68:
            if congratsBackground.isReady {
                congratsBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(congratsBackground)
            }
        case 69: 
            if ggBackground.isReady {                         
                ggBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(ggBackground)
                     }
             
        default: fatalError("background does not exist")
        }

    }
}


