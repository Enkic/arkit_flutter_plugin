import ARKit
import Foundation

func createImageTrackingConfiguration(_ arguments: [String: Any]) -> ARImageTrackingConfiguration? {
    NSLog("createImageTrackingConfiguration");
    if ARImageTrackingConfiguration.isSupported {
        NSLog("createImageTrackingConfiguration ARImageTrackingConfiguration supported");
        let imageTrackingConfiguration = ARImageTrackingConfiguration()

        if let trackingImagesGroupName = arguments["trackingImagesGroupName"] as? String,
           let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: trackingImagesGroupName, bundle: nil)
        {
            imageTrackingConfiguration.trackingImages = referenceImages
        }
        if let trackingImages = arguments["trackingImages"] as? [[String: Any]] {
            debugPrint("get trackingImages");
            imageTrackingConfiguration.trackingImages = parseReferenceImagesSet(trackingImages)
        }
        if let maximumNumberOfTrackedImages = arguments["maximumNumberOfTrackedImages"] as? Int {
            imageTrackingConfiguration.maximumNumberOfTrackedImages = maximumNumberOfTrackedImages
        }
        return imageTrackingConfiguration
    }
    return nil
}
