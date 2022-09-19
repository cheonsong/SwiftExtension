import Foundation
import UIKit

extension String
{
    /// Replace String
    /// - Parameter target: Base Target String
    /// - Parameter withString: String you want to replace
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    /// Get Substring
    /// - Parameter from: Start Index
    /// - Parameter to: End Index
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) //
        
        return String(self[startIndex ..< endIndex])
    }
    
    /// HTML -> AttributedString
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    /// HTML -> String
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    /// Number of "\n"
    var numberOfLines : Int {
        return self.components(separatedBy: "\n").count
    }
    
    /// Localized String
    var localized: String {
      return NSLocalizedString(self, comment: "")
    }
}
