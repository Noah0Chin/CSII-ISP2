import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class MassShotBackground : RenderableEntity {

    var didRender = false

    let havenBackground : Image
    let breezeBackground : Image
    let massShotBackgroundAudio : Audio

    
    init() {

        guard let havenBackgroundURL = URL(string:"https://wallpaperboat.com/wp-content/uploads/2020/06/04/43354/valorant-15.jpg") else {
            fatalError("Failed to create the URL for havenBackground")
        }
        havenBackground = Image(sourceURL:havenBackgroundURL)

        guard let breezeBackgroundURL = URL(string:"https://cdn1.dotesports.com/wp-content/uploads/2021/04/22125658/Breeze-VAL.jpg") else {
            fatalError("Failed to create the URL for breezeBackground")
        }

        breezeBackground = Image(sourceURL:breezeBackgroundURL)


        guard let massShotBackgroundAudioURL = URL(string:"https://docs.google.com/uc?export=open&id=1hV_TRXuERLcVPYEJD8FPvgCBeL7v321w") else {
            fatalError("Failed to create the URL for massShotBackgroundAudio")
        }

        
        massShotBackgroundAudio = Audio(sourceURL:massShotBackgroundAudioURL)
            
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"MassShotBackground")
    }

    override func setup(canvasSize: Size, canvas:Canvas) {
        canvas.setup(breezeBackground)
        canvas.setup(havenBackground)
        canvas.setup(massShotBackgroundAudio)
    }

    public func noMusic() {
        massShotBackgroundAudio.mode = .pause        
    }

    public func yesMusic() {
        massShotBackgroundAudio.mode = .play
    }
    
    let backgroundRandomizer = Int.random(in: 1...4)


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
            if massShotBackgroundAudio.isReady {
                canvas.render(massShotBackgroundAudio)
            }
        default: fatalError("background does not exist")
        }

    }
}


