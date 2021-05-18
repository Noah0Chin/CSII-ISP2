import Scenes
import Foundation
import Igis

class TrackshotTarget: RenderableEntity, EntityMouseEnterHandler, EntityMouseLeaveHandler {

    var ellipse : Ellipse
    let strokeStyle = StrokeStyle(color:Color(.black))
    var fillStyle = FillStyle(color:Color(.magenta))
    let lineWidth = LineWidth(width:7)
    var didRender = false
    var Score = 0
    var shouldScore = false
    var frameCounter = 0
    // Renders the score
    func renderLabel(canvas:Canvas, patternId:Int) {
        let text = Text(location:Point(x:150, y:100), text:"\(Score)")
        text.font = "80pt Roboto"
        canvas.render(FillStyle(color:Color(.mediumpurple)))
        canvas.render(text)
    }
    // Picks the inital velocity of the ball
    var velocityX = Int.random(in: -6 ... 6)
    var velocityY = Int.random(in: -6 ... 6)
      
    init(center:Point, radiusX: Int, radiusY: Int) {
        ellipse = Ellipse(center:center,radiusX: radiusX, radiusY: radiusY, fillMode:.fillAndStroke)
        super.init(name:"Target")
    }
    // creates bounding rect for the ball towards the sides of the wall
    override func boundingRect() -> Rect {
        
        
        let leftPoint = ellipse.center.x - ellipse.radiusX
        let top = ellipse.center.y - ellipse.radiusY
        let width = ellipse.radiusX * (3/2)
        let height = ellipse.radiusY * (3/2)
        
        return Rect(topLeft: Point(x: leftPoint , y: top ), size: Size(width: width, height: height))
       // return Rect(size :Size(width: Int.max, height: Int.max))
    }
    // calculates velocity for the ball
    override func calculate(canvasSize: Size) {
        // First, move to the new position
        ellipse.center += Point(x:velocityX, y:velocityY)
        // Form a bounding rectangle around the canvas
        let canvasBoundingRect = Rect(size:canvasSize)
        // Form a bounding rect around the ball (ellipse)
        let ballBoundingRect = Rect(topLeft:Point(x:ellipse.center.x-ellipse.radiusX, y:ellipse.center.y-ellipse.radiusY),
                                    size:Size(width:ellipse.radiusX*2, height:ellipse.radiusY*2))        
        // Determine if we've moved outside of the canvas boundary rect
        let tooFarLeft = ballBoundingRect.topLeft.x < canvasBoundingRect.topLeft.x
        let tooFarRight = ballBoundingRect.topLeft.x + ballBoundingRect.size.width > canvasBoundingRect.topLeft.x + canvasBoundingRect.size.width
        let tooFarUp = ballBoundingRect.topLeft.y < canvasBoundingRect.topLeft.y
        let tooFarDown = ballBoundingRect.topLeft.y + ballBoundingRect.size.height > canvasBoundingRect.topLeft.y + canvasBoundingRect.size.height        

        if tooFarLeft || tooFarRight {
            velocityX = -velocityX
        }        
        if tooFarUp || tooFarDown {
            velocityY = -velocityY
        }
        if shouldScore == true {
            Score += 1 
        }
    }
    // setups the mouse enter and leave handler
    override func setup(canvasSize:Size, canvas:Canvas) {
        dispatcher.registerEntityMouseEnterHandler(handler:self)
        dispatcher.registerEntityMouseLeaveHandler(handler:self)      
    }
    // desetups the mouse enter and leave handler
    override func teardown() {
        dispatcher.unregisterEntityMouseEnterHandler(handler:self)      
        dispatcher.unregisterEntityMouseLeaveHandler(handler:self)      
    }
    // adds score and changes color when the mouse is actually on the ball
    func onEntityMouseEnter(globalLocation:Point) {
        fillStyle = FillStyle(color:Color(.purple))
        shouldScore = true
    }
    // resets the ball to its original color
    func onEntityMouseLeave(globalLocation:Point) {
        fillStyle = FillStyle(color:Color(.magenta))
        shouldScore = false
    } 
    // renders the ball
    override func render(canvas: Canvas) {              
        if  !didRender {
            // randomizes the velocity every 120 frames or roughly 4 seconds
            if frameCounter == 120 {
                velocityX = Int.random(in: -5 ... 5)
                velocityY = Int.random(in: -5 ... 5)
                frameCounter = 0
            }
            // renders ball then the score 
            canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
            renderLabel(canvas:canvas, patternId:Score)
            frameCounter += 1
        }  
    }
}
