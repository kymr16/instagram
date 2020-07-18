//
//  PostData.swift
//  Instagram
//
//  Created by 吉田 玲子 on 2020/07/12.
//  Copyright © 2020 reiko.yoshida. All rights reserved.
//

import UIKit
import Firebase

class CommentsData: NSObject {
    var id: String
    var postId: String?
    var name: String?
    var comment: String?
    var date: Date?

    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let commentsDic = document.data()
        
        self.postId = commentsDic["postId"] as? String

        self.name = commentsDic["name"] as? String

        self.comment = commentsDic["comment"] as? String

        let timestamp = commentsDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
    }
}
