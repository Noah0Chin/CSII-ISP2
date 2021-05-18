import Scenes

  /*
     This class is responsible for the background Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class MenuBackgroundLayer : Layer {
      let menuBackground = MenuBackground()

      let gunShot = GunShot()
      
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"MenuBackground")

          // We insert our RenderableEntities in the constructor
          insert(entity:menuBackground, at:.back)
          insert(entity:gunShot, at:.inFrontOf(object:menuBackground))
      }
  }
