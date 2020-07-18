//
//  CommentPostViewController.swift
//  Instagram
//
//  Created by 吉田 玲子 on 2020/07/18.
//  Copyright © 2020 reiko.yoshida. All rights reserved.
//

import Firebase
import UIKit
import FirebaseUI

class CommentPostViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    
    var parentPostID: String!
    var parentImageRef: StorageReference!
    var parentCaption: String!
    var name = Auth.auth().currentUser?.displayName
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captionLabel.text = parentCaption
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: parentImageRef)
        userNameLabel.text = "\(name!) :"
    }
    
    @IBAction func handlePostButton(_ sender: Any) {
        // コメントを投稿する
        let commentText = commentTextField.text
        let postRef = Firestore.firestore().collection(Const.PostPath).document(parentPostID)
        var updateValue: FieldValue
        updateValue = FieldValue.arrayUnion(["\(self.name!) : \(commentText!)"])
        postRef.updateData(["comments": updateValue])
        // ホームに戻る
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // ホームに戻る
        self.dismiss(animated: true, completion: nil)
    }
}
