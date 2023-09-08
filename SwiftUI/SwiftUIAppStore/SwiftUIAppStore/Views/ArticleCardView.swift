//
//  ArticleCardView.swift
//  SwiftUIAppStore
//
//  Created by pablo borquez on 17/04/23.
//

import SwiftUI

struct ArticleCardView: View {
    let article: Article
    
    @Binding var isShowContent: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image(uiImage: self.article.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width,
                                   height: self.isShowContent ?
                                        geometry.size.height * 0.7 :
                                        min(self.article.image.size.height/3, 500)
                            )
                            .border(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1),
                                    width: self.isShowContent ? 0 : 1)
                            .cornerRadius(15)
                            .overlay(
                                ArticleExcerptView(article: self.article, isShowContent: self.$isShowContent)
                                    .cornerRadius(self.isShowContent ? 0 : 15)
                            )
                        
                        if self.isShowContent {
                            Text(self.article.content)
                                .foregroundColor(Color(.darkGray))
                                .font(.system(.body, design: .rounded))
                                .padding(.horizontal)
                                .padding(.bottom, 50)
                                .transition(.move(edge: .bottom))
                        }
                    }
                }
                .shadow(color: Color(.sRGB, red: 64/255, green: 64/255, blue: 64/255, opacity: 0.3),
                    radius: self.isShowContent ? 0 : 15)
                
                if self.isShowContent {
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation(.easeInOut) {
                                self.isShowContent = false
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 26))
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                    }
                    .padding(.top, 50)
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ArticleCardView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCardView(article: Article.create()[1],
                        isShowContent: .constant(true))
        .previewLayout(.fixed(width: 380, height: 500))
        
        ArticleCardView(article: Article.create()[1],
                        isShowContent: .constant(false))
        .previewLayout(.fixed(width: 380, height: 500))
    }
}
