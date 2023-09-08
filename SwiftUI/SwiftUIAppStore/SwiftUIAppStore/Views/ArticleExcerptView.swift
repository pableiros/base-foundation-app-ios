//
//  ArticleExcerptView.swift
//  SwiftUIAppStore
//
//  Created by pablo borquez on 18/04/23.
//

import SwiftUI

struct ArticleExcerptView: View {
    let article: Article
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Rectangle()
                .frame(minHeight: 100, maxHeight: 150)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(self.article.category.uppercased())
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                            
                            Text(self.article.headline)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .minimumScaleFactor(0.1)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            if !self.isShowContent {
                                Text(self.article.subHeadline)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .minimumScaleFactor(0.1)
                                    .lineLimit(3)
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                )
        }
        .foregroundColor(.white)
    }
}

struct ArticleExcerptView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleExcerptView(article: Article.create().first!,
                        isShowContent: .constant(true))
        .previewLayout(.fixed(width: 380, height: 500))
        
        ArticleExcerptView(article: Article.create().first!,
                        isShowContent: .constant(false))
        .previewLayout(.fixed(width: 380, height: 500))
    }
}
