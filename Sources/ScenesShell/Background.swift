import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {

    var didRender = false

    let havenBackground : Image
    let breezeBackground : Image

    
    init() {

        guard let havenBackgroundURL = URL(string:"https://wallpaperboat.com/wp-content/uploads/2020/06/04/43354/valorant-15.jpg") else {
            fatalError("Failed to create the URL for havenBackground")
        }
        havenBackground = Image(sourceURL:havenBackgroundURL)

        guard let breezeBackgroundURL = URL(string:"https://cdn1.dotesports.com/wp-content/uploads/2021/04/22125658/Breeze-VAL.jpg") else {
            fatalError("Failed to create the URL for breezeBackground")
        }

        breezeBackground = Image(sourceURL:breezeBackgroundURL)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize: Size, canvas:Canvas) {
        canvas.setup(breezeBackground)
        canvas.setup(havenBackground)

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
            if breezeBackground.isReady {
                breezeBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(breezeBackground)
            }
        case 2:
            if havenBackground.isReady {
                havenBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(havenBackground)
            }
        default: fatalError("background does not exist")
        }

    }
}


