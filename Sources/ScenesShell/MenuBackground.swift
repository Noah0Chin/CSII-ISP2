import Foundation
import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class MenuBackground : RenderableEntity {

    var didRender = false

   private var playMusic = true
    let havenBackground : Image
    let breezeBackground : Image
    let backgroundAudio : Audio
    let icebox : Image
    let minecraftshaders : Image
    
    init() {
        guard let havenBackgroundURL = URL(string:"https://wallpaperboat.com/wp-content/uploads/2020/06/04/43354/valorant-15.jpg") else {
            fatalError("Failed to create the URL for havenBackground")
        }
        havenBackground = Image(sourceURL:havenBackgroundURL)

        guard let breezeBackgroundURL = URL(string:"https://cdn1.dotesports.com/wp-content/uploads/2021/04/22125658/Breeze-VAL.jpg") else {
            fatalError("Failed to create the URL for breezeBackground")
        }

        breezeBackground = Image(sourceURL:breezeBackgroundURL)

        

        guard let backgroundAudioURL = URL(string:"https://docs.google.com/uc?export=open&id=1hV_TRXuERLcVPYEJD8FPvgCBeL7v321w") else {
            fatalError("Failed to create the URL for backgroudAudio")
        }
        
        backgroundAudio = Audio(sourceURL:backgroundAudioURL)
            

        guard let iceboxURL = URL(string:"https://cdn.discordapp.com/attachments/249296687669968907/843769853474373672/Icebox_ConceptB_v2.png") else {
            fatalError("Failed to create the URL for icebox")
        }
        icebox = Image(sourceURL:iceboxURL)


        guard let minecraftshadersURL = URL(string:"https://cdn.discordapp.com/attachments/249296687669968907/843769768519270461/wp5961273.png") else {
            fatalError("Failed to create the URL for icebox")
        }
        minecraftshaders = Image(sourceURL:minecraftshadersURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"MenuBackground")
    }

    override func setup(canvasSize: Size, canvas:Canvas) {
        canvas.setup(breezeBackground)
        canvas.setup(havenBackground)
        canvas.setup(backgroundAudio)
        canvas.setup(icebox)
        canvas.setup(minecraftshaders)
    }
    
    
    public func shouldMusicPlay() {
        playMusic = !playMusic
        print("works")
        backgroundAudio.mode = .pause
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
            if breezeBackground.isReady && backgroundAudio.isReady {
                breezeBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))             
                canvas.render(breezeBackground)
                canvas.render(backgroundAudio)
            }
            
        case 2:
            if havenBackground.isReady && backgroundAudio.isReady {
                havenBackground.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(havenBackground)
                canvas.render(backgroundAudio)
            }
            
        case 3:
            if icebox.isReady && backgroundAudio.isReady {
                icebox.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(icebox)
                canvas.render(backgroundAudio)             
            } 
                                               
        case 4:
            if minecraftshaders.isReady && backgroundAudio.isReady {
                minecraftshaders.renderMode = .destinationRect(Rect(topLeft:Point(x:0,y:0), size:canvas.canvasSize!))
                canvas.render(minecraftshaders)
                canvas.render(backgroundAudio)

            }
             
           
            
            
        default: fatalError("background does not exist")
        }

    }
}
