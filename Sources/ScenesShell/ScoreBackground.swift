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

    
    init() {

        guard let congratsBackgroundURL = URL(string:"https://p.kindpng.com/picc/s/3-30466_image-result-for-congratulations-png-congratulations-png-transparent.png") else {
            fatalError("Failed to create the URL for congratsBackground")
        }
        congratsBackground = Image(sourceURL:congratsBackgroundURL)

        guard let ggBackgroundURL = URL(string:"https://organization.gg/2942460e508d5b699a1b7577a2f55c3f.png") else {
            fatalError("Failed to create the URL for ggBackground")
        }

        ggBackground = Image(sourceURL:ggBackgroundURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"ScoreBackground")
    }

    override func setup(canvasSize: Size, canvas:Canvas) {
        canvas.setup(ggBackground)
        canvas.setup(congratsBackground)

    }


    let backgroundRandomizer = Int.random(in: 1...2)
    override func render(canvas:Canvas) {
        if let canvasSize = canvas.canvasSize, !didRender {
            // Clear the entire canvas
            let clearRect = Rect(topLeft: Point(x:0,y:0), size:canvasSize)
            let clearRectangle = Rectangle(rect:clearRect, fillMode:.clear)
            canvas.render(clearRectangle)
        }



        switch (backgroundRandomizer) {
        case 1:
            if ggBackground.isReady {
                ggBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(ggBackground)
            }
        case 2:
            if congratsBackground.isReady {
                congratsBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(congratsBackground)
            }
        default: fatalError("background does not exist")
        }

    }
}


