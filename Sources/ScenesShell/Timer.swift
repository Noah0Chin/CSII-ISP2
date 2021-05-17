import Foundation
import Scenes
import Igis


class Timer: RenderableEntity {


    var nextEnqueueScene : Scene
    var seconds = 0
    var frameCounter = 0
    var endTimeLimit : Int
    var timerClose = false
    
    init(enqueueScene: Scene, timeLimit: Int) {
        nextEnqueueScene = enqueueScene
        endTimeLimit = timeLimit
        super.init(name:"Timer")
                                                              
    }
    
    var canvasYpoint = 0
    var canvasXpoint = 0

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvasXpoint = canvasSize.center.x
        canvasYpoint = canvasSize.center.y
    }    
    
    func createTimer(canvas: Canvas, seconds: Int, color:Color) {
        let timerText = Text(location:Point(x: canvasXpoint, y: 30), text: "\(seconds)")
        timerText.font = "30pt Courier New bold"
        
        let box = Rectangle(rect:Rect(topLeft:Point(x: canvasXpoint - 17, y:12), size:Size(width:34, height:34)), fillMode:.fill)       
        let boxBorder = Rectangle(rect:Rect(topLeft:Point(x: canvasXpoint - 24, y:15), size:Size(width:36, height:37)), fillMode:.fill)
        
        
        canvas.render(FillStyle(color:Color(.black)))
        canvas.render(boxBorder)        
        canvas.render(FillStyle(color:Color(.gray)))
        canvas.render(box)

        canvas.render(FillStyle(color:color))
        canvas.render(timerText)
    }


    override func render(canvas:Canvas) {
        
        // this keep track of time, adds a second every 30 frames and renders the timer text
        if frameCounter == 30 {
            frameCounter = 0
            seconds += 1
            createTimer(canvas:canvas,seconds:seconds,color:Color(.white))
        } else {
            // this resets adds a frame everytime a frame has passed, and will render the timer with red an white blinking lights when there is 5 seconds left
            frameCounter += 1
            if timerClose && frameCounter < 15 {
                createTimer(canvas:canvas,seconds:seconds,color:Color(.red))

            } else {
                createTimer(canvas:canvas,seconds:seconds,color:Color(.white))
            }
            
        }

        // boolean to help keep track of red and white blink when time is nearing a end
        if seconds >= endTimeLimit - 5 {
            timerClose = true
        }

        // transistions the scene after time ends
        if seconds == endTimeLimit {
            director.enqueueScene(scene:nextEnqueueScene)
            director.transitionToNextScene()
        }
        
       
    }

    
}
