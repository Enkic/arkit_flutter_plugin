import Foundation

func getImageByName(_ name: String) -> UIImage? {
    let fileManager = FileManager.default
    if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let imagePath = documentsDirectory.appendingPathComponent(name)
        // Vérifiez si l'image existe dans le répertoire Documents
        if fileManager.fileExists(atPath: imagePath.path) {
            return UIImage(contentsOfFile: imagePath.path)
        }
    }

    if let img = UIImage(named: name) {
        return img
    }
    if let path = Bundle.main.path(forResource: SwiftArkitPlugin.registrar!.lookupKey(forAsset: name), ofType: nil) {
        return UIImage(named: path)
    }
    if let url = URL(string: name) {
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {}
    }
    if let base64 = Data(base64Encoded: name, options: .ignoreUnknownCharacters) {
        return UIImage(data: base64)
    }
    return nil
}
