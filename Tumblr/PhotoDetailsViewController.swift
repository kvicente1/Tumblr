//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Karina Vicente on 11/29/18.
//  Copyright © 2018 Karina Vicente. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var detailTextLabel: UILabel!
    
    var photoURL: URL?
    var detailText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.af_setImage(withURL: photoURL!)
        detailTextLabel.attributedText = removeHTMLFromCaption(captionWithHTML: detailText!)
        detailTextLabel.font = UIFont(name: "HelveticaNeue", size: 12)
    }
    
   override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
    func removeHTMLFromCaption(captionWithHTML: String) -> NSAttributedString? {
        var captionWithoutHTML: NSAttributedString?
        if let data = captionWithHTML.data(using: .utf8) {
            do {
                captionWithoutHTML = try NSAttributedString(
                    data: data,
                    options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
                    documentAttributes: nil)
            }
            catch {
                print("Error parsing HTML caption!")
            }
        }
        return captionWithoutHTML
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
