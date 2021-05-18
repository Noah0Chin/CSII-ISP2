import Scenes
import Igis


    func timerGridshot() -> Timer {
        guard let timerO = scene as? GridshotScene else { 
            fatalError("menuScene of type FlickshotScene is required")
        }
        let backgroundLayer = timerO.gridshotInteractionLayer
        let timerGridshot = backgroundLayer.timer
        return timerGridshot
    }
    
        
    func timerFlickshot() -> Timer {
        guard let timerO = scene as? FlickshotScene else { 
            fatalError("menuScene of type FlickshotScene is required")
        }
        let backgroundLayer = timerO.flickshotInteractionLayer
        let timerFlickshot = backgroundLayer.timer
        return timerFlickshot
    }
    

        
    func timerMassShot() -> Timer {
        guard let timerO = scene as? MassShotScene else { 
            fatalError("menuScene of type MassShotScene is required")
        }
        let backgroundLayer = timerO.massShotInteractionLayer
        let timerMassShot = backgroundLayer.timer
        return timerMassShot
    }
    

        
    func timerTrackshot() -> Timer {
        guard let timerO = scene as? TrackshotScene else { 
            fatalError("menuScene of type FlickShotScene is required")
        }
        let backgroundLayer = timerO.trackshotInteractionLayer
        let timerTrackshot = backgroundLayer.timer
        return timerTrackshot
    }
    

    
