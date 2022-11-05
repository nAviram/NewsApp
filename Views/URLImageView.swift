//
//  URLImageView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct URLImageView: View {
    let urlString : String?
    var imageWidth : CGFloat = Constants.ImageFrameWidth
    var imageHeight : CGFloat = Constants.ImageFrameHeight
    
    @State var data : Data?
    
    var body: some View {
        
        AsyncImage(
                url: URL(string: urlString ?? ""),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: imageWidth, height: imageHeight, alignment: .center)
                        
                },
                placeholder: {
                    ZStack{
                        Image(systemName: "newspaper").resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth, height: imageHeight, alignment: .center)
                            .opacity(0.3)
                        ProgressView()
                            .frame(width: 50, height: 50, alignment: .center)
                            .aspectRatio(contentMode: .fit)
                    }
                }
            )

    }
    
    
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: "https://www.youtube.com/watch?v=MBCX1atOvdA")
    }
}
