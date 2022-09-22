//
//  URLImageView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct URLImageView: View {
    let urlString : String?
    
    @State var data : Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .frame(width: Constants.ImageFrameWidth, height: Constants.ImageFrameHeight)
                .background(Color.gray)
        }else{
            Image("")
                .resizable()
                .frame(width: Constants.ImageFrameWidth, height: Constants.ImageFrameHeight)
                .background(Color.gray)
                .onAppear(){
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        guard (urlString != nil) else{
            return
        }
        
        guard let url = URL(string: urlString!) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ data,_,_ in
            self.data = data
        }
        task.resume()
    }
    
    
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: "https://i.ytimg.com/vi/4Q46xYqUwZQ/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAS_Nc7-GLRUYSe9xuDqi7qU96S-g")
    }
}
