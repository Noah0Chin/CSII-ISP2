import Scenes
import Igis
import Foundation
import ScenesControls


/*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class MassShotInteractionLayer : Layer {
       
    let endGameTimer = Timer(enqueueScene:ScoreScene(), timeLimit: 30)
    var target : Target
    var destructionCount = 0
    var entityCount = [0]
    var entityVal = 1
    var frameCount = 0
      init() {
          // Using a meaningful name can be helpful for debugging
          target = Target(center:Point(x:500,y:500), radiusX: 20, radiusY: 20)

          super.init(name:"Interaction")
          
          for _ in 0 ..< Int.random(in:1...10) {
              let centerPoint = Point(x:Int.random(in:300 ... 1700), y:Int.random(in:300 ... 780))
              let radiusX = Int.random(in:15 ... 30)
              let radiusY = radiusX
              let velocity = Int.random(in:-2 ... 2)
              target = Target(center:centerPoint, radiusX: radiusX, radiusY: radiusY)
              insert(entity:target, at:.front)
              entityCount.append(entityVal)
              entityVal += 1
              target.changeVelocity(velocityX: velocity, velocityY: velocity)             
          }
          
          // We insert our RenderableEntities in the constructor
          insert(entity:endGameTimer, at: .front)
      }

      override func postCalculate(canvas: Canvas) {

          if frameCount <= 30 {
              frameCount += 1 
          } else {
              frameCount = 0
          }
          
          if entityCount.count < 80 && (frameCount == 30 || frameCount == 15){
          let centerPoint = Point(x:Int.random(in:300 ... 1700), y:Int.random(in:300 ... 780))
          let radiusX = Int.random(in:20 ... 30)
          let radiusY = radiusX
          let velocityY = Int.random(in: -2 ... 2)
          let velocityX = Int.random(in: -2 ... 2)
          target = Target(center:centerPoint, radiusX: radiusX, radiusY: radiusY)
          insert(entity:target, at:.front)
          entityCount.append(entityVal)
          entityVal += 1
          target.changeVelocity(velocityX: velocityX, velocityY: velocityY)         
          }          
      }
  }
