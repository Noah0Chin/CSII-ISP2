import Scenes
import Igis
<<<<<<< HEAD
import Foundation
=======
import ScenesControls
>>>>>>> 797440b58e2ea1bc4a29d49cf9e2ad50aacd3b8f

/*
     This class is responsible for the interaction Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class InteractionLayer : Layer {

<<<<<<< HEAD
    

    let target = Target(center:Point(x:250,y:300),radiusX: 10, radiusY:23)
=======
    let bullethole = GunShot()
    let target = Target()
>>>>>>> 797440b58e2ea1bc4a29d49cf9e2ad50aacd3b8f
    
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Interaction")

          // We insert our RenderableEntities in the constructor
          insert(entity: target, at:.front)         
          target.changeVelocity(velocityX: 1, velocityY: 2)
          

      }
  }
