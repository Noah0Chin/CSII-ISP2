import Scenes
import Igis
import Foundation
import ScenesControls


/*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {


    

    let target = Target(center:Point(x:250,y:300),radiusX: 10, radiusY:23)
    let firstTimer = Timer(enqueueScene:ScoreScene(), timeLimit: 10)
      init() {
          // Using a meaningful name can be helpful for debuggin
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          insert(entity: target, at:.front)         
          target.changeVelocity(velocityX: 1, velocityY: 2)
          insert(entity: firstTimer, at:.front)

      }
  }
