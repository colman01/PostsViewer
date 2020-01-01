//
//  CommentsViewModel.swift
//  PostViewer
//
//  Created by Colman Marcus-Quinn on 18.12.19.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
import RxSwift

class CommentsViewModel {
    
    var isFav:Bool = false
    
    var comments: [CommentsModel] = []
    
    var disposeBag = DisposeBag()
    
    let itemsDownloaded = PublishSubject<()>()
    
    var postIndex = -1;
    
    
    func getComments() {
        let client = NetworkManager.shared
        do{
            try client.getCommentItems().subscribe(
                onNext: { result in
                    
                    self.comments = result.filter { $0.postId == PostManager.shared.posts[self.postIndex].id }
            },	
                onError: { error in
                    print(error)
            }, onCompleted: {

                self.itemsDownloaded.onCompleted()
                
            }).disposed(by: self.disposeBag)
        }
        catch{
        }
    }
    
}
