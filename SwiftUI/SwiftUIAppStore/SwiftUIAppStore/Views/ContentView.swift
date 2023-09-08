//
//  ContentView.swift
//  SwiftUIAppStore
//
//  Created by pablo borquez on 17/04/23.
//

import SwiftUI

struct ContentView: View {
    let articles: [Article] = Article.create()
    
    @State private var showContent = false
    @State private var selectedArticleIndex: Int?
    
    @Namespace var nsArticle
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 40) {
                    TopBarView()
                        .padding(.horizontal, 20)
                    
                    ForEach(self.articles.indices, id: \.self) { index in
                        ArticleCardView(article: self.articles[index],
                                        isShowContent: self.$showContent)
                            .padding(.horizontal, 20)
                            .frame(height: min(self.articles[index].image.size.height / 3, 500))
                            .matchedGeometryEffect(id: index, in: self.nsArticle)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.35,
                                                                 dampingFraction: 0.95,
                                                                 blendDuration: 0.8)) {
                                    self.selectedArticleIndex = index
                                    self.showContent.toggle()
                                }
                            }
                    }
                }
            }
            .opacity(self.showContent ? 0 : 1)
            
            if self.showContent, let selectedArticleIndex {
                ArticleCardView(article: self.articles[selectedArticleIndex],
                                isShowContent: self.$showContent)
                .matchedGeometryEffect(id: selectedArticleIndex, in: self.nsArticle)

                .ignoresSafeArea()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
