//
//  CollectionViewFactory.swift
//  UIKitWithSwiftUI
//
//  Created by pablo borquez on 21/09/23.
//

import UIKit
import SwiftUI

class CollectionViewFactory: NSObject, UICollectionViewDataSource {
    private var data = StaticData()
    private var collectionView: UICollectionView!
    
    private var heartRateCellRegistration: UICollectionView.CellRegistration<UICollectionViewCell, HeartRateData> = {
        .init { cell, indexPath, item in
            cell.contentConfiguration = UIHostingConfiguration {
                HeartRateCellView(data: item)
            }
            .margins(.horizontal, LayoutMetrics.horizontalMargin)
            .background {
                RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius, style: .continuous)
                    .fill(Color(uiColor: .secondarySystemGroupedBackground))
            }
        }
    }()
    
    func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { [unowned self] sectionIndex, layoutEnvironment in
            return createOrthogonalScrollingSection()
        }
        
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.backgroundColor = .systemGroupedBackground
        self.collectionView.allowsSelection = false
        self.collectionView.dataSource = self
        
        return self.collectionView
    }

    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HealthSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.heartRateItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data.heartRateItems[indexPath.item]
        return collectionView.dequeueConfiguredReusableCell(using: heartRateCellRegistration, for: indexPath, item: item)
    }
    
    // MARK: - private
    
    private func createOrthogonalScrollingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .zero
        group.contentInsets.leading = LayoutMetrics.horizontalMargin
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = .zero
        section.contentInsets.trailing = LayoutMetrics.horizontalMargin
        section.contentInsets.bottom = LayoutMetrics.sectionSpacing
        
        return section
    }
}
