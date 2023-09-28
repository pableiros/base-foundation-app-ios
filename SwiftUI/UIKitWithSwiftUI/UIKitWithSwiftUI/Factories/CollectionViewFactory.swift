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
    
    private var healthCategoryCellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, HealthCategory> = {
        .init { cell, indexPath, item in
            cell.contentConfiguration = UIHostingConfiguration {
                HealthCategoryCellView(healthCategory: item)
            }
        }
    }()
    
    private var sleepCellRegistration: UICollectionView.CellRegistration<UICollectionViewCell, SleepData> = {
        .init { cell, indexPath, item in
            cell.contentConfiguration = UIHostingConfiguration {
                SleepCellView(data: item)
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
            switch HealthSection(rawValue: sectionIndex)! {
            case .heartRate:
                return self.createOrthogonalScrollingSection()
            case .healthCategories:
                return self.createListSection(layoutEnvironment)
            case .sleep:
                return self.createGridSection()
            }
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
        switch HealthSection(rawValue: section)! {
        case .heartRate:
            return data.heartRateItems.count
        case .healthCategories:
            return data.healthCategories.count
        case .sleep:
            return data.sleepItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch HealthSection(rawValue: indexPath.section)! {
        case .heartRate:
            let item = data.heartRateItems[indexPath.item]
            return collectionView.dequeueConfiguredReusableCell(using: heartRateCellRegistration, for: indexPath, item: item)
        case .healthCategories:
            let item = data.healthCategories[indexPath.item]
            return collectionView.dequeueConfiguredReusableCell(using: healthCategoryCellRegistration, for: indexPath, item: item)
        case .sleep:
            let item = data.sleepItems[indexPath.item]
            return collectionView.dequeueConfiguredReusableCell(using: sleepCellRegistration, for: indexPath, item: item)
        }
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
    
    private func createListSection(_ layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let section = NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        
        section.contentInsets = .zero
        section.contentInsets.leading = LayoutMetrics.horizontalMargin
        section.contentInsets.trailing = LayoutMetrics.horizontalMargin
        section.contentInsets.bottom = LayoutMetrics.sectionSpacing
        
        return section
    }
    
    private func createGridSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
    
        group.interItemSpacing = .fixed(8)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 8
        section.contentInsets = .zero
        section.contentInsets.leading = LayoutMetrics.horizontalMargin
        section.contentInsets.trailing = LayoutMetrics.horizontalMargin
        section.contentInsets.bottom = LayoutMetrics.sectionSpacing
        
        return section
    }
}
