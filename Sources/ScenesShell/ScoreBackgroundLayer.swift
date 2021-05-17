import Scenes


  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ScoreBackgroundLayer : Layer {
      let background = ScoreBackground()

      let confettiShot = ConfettiShot()
      
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"ScoreBackground")

          // We insert our RenderableEntities in the constructor
          insert(entity:background, at:.back)
          insert(entity:confettiShot, at:.inFrontOf(object:background))
      }
  }
