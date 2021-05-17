import Scenes
import Foundation
import Igis

class WipeshotTarget: RenderableEntity, EntityMouseClickHandler {

    // Creates a an ellipse which is the Target
    //    let ellipse = Ellipse(center:Point(x:0,y:0), radiusX:30, radiusY:30, fillMode:.fillAndStroke)
    var ellipse : Ellipse
    let strokeStyle = StrokeStyle(color:Color(.black))
    let fillStyle = FillStyle(color:Color(.red))
    let lineWidth = LineWidth(width:8)


    
    // variables for target sound
    let targetSound : Audio
    var playTargetBreakSound = false
      
    // variable destroyed tells whether or not to render the target
    var destroyed = false

    // Velocity vectors for the target
    var velocityX : Int
    var velocityY : Int

    
    // dimenstion vectors for the target, (ex used in reszing the ellipse at a certain rate
    var dimensionX : Int
    var dimensionY : Int

    //////////////////
    // Init
    /////////////////
    
    init(center:Point, radiusX: Int, radiusY: Int) {
        ellipse = Ellipse(center:center,radiusX: radiusX, radiusY: radiusY, fillMode:.fillAndStroke)
        
        // set default vector values to  0
        velocityX = 0
        velocityY = 0

        dimensionX = 0
        dimensionY = 0

        // gaurd let sets up sound url
        guard let targetBreakSoundURL = URL(string:"https://huds.tf/site/xthreads_attach.php/943_1517838564_9363c028/ce8e457f2cfcda3c2b716e2e4214ba51/Hitsound_COD.wav") else {
            fatalError("Failed to create the URL for targetBreakSound")
        }
        targetSound = Audio(sourceURL: targetBreakSoundURL)
        
        //Using a meaningful name can be helpful for debugging
        super.init(name:"Target")
    }
    
 
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // Public Functions These functions are used in other files (such as interaction layer) so we can change the velocity of a target object)
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public func changeVelocity(velocityX: Int, velocityY:Int) {
        self.velocityX = velocityX
        self.velocityY = velocityY
    }

    public func changeDimensions(dimensionX: Int, dimensionY: Int) {
        self.dimensionX = dimensionX
        self.dimensionY = dimensionY
    }

    // calculate fuctions calculates the repositing and any other things that involve the target changing values
    
    override func calculate(canvasSize: Size) {

        // the calculate function will calculate the ellipse center change due to velocity vectors
        ellipse.center += Point(x: velocityX, y: velocityY)

        // the calculate function will calculate the rate at which the ellipse dimensions will change due to dimension vectors
        ellipse.radiusX += dimensionX
        ellipse.radiusY += dimensionY

        
    }
    
    var canvasX = 0
    var canvasY = 0

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvasX = canvasSize.center.x
        canvasY = canvasSize.center.y        
        dispatcher.registerEntityMouseClickHandler(handler:self)
        canvas.setup(targetSound)
    }

    override func teardown() {
        dispatcher.unregisterEntityMouseClickHandler(handler:self)      
    }

    
    func onEntityMouseClick(globalLocation: Point) {
        destroyed = true
        playTargetBreakSound = true
    }

    var centerPosition = false
    
    override func render(canvas: Canvas) {
        if destroyed == true {
            let xPosition = Int.random(in: 200 ..< canvasX*2)
            let yPosition = Int.random(in: 200 ..< canvasY*2)            
            centerPosition = !centerPosition
            
            if centerPosition == false {                
                ellipse.center = Point(x:xPosition, y:yPosition)                                
            } else {
                ellipse.center = Point(x:canvasX, y:canvasY)                
            }
            destroyed = !destroyed                        
    
        } else {         
            canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)            
        }
    
        if targetSound.isReady && playTargetBreakSound == true{
            canvas.render(targetSound)
            playTargetBreakSound = !playTargetBreakSound
            print("target gone")
        } 
        
    }
        
    override func boundingRect() -> Rect {
        return Rect(topLeft:Point(x:ellipse.center.x - ellipse.radiusX, y: ellipse.center.y - ellipse.radiusY), size: Size(width: ellipse.radiusX * 2, height: ellipse.radiusY * 2))
    
    }      
}
