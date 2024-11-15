//
//  FilterView.swift
//  TeamB
//
//  Created by Yuki Kuwashima on 2024/11/16.
//

import SwiftUI

struct FilterView: View {

    @Binding var farms: [Farm]
    @Binding var visibleFruits: [Fruit]
    @Binding var visibleFacilities: [FacilityStatus]
    @Binding var visibleAccesses: [AccessTag]

    var fruitSection: some View {
        Section {
            ForEach(Fruit.allCases) { fruit in
                Button {
                    toggle(fruit, in: &visibleFruits)
                } label: {
                    Text(fruit.rawValue)
                        .bold()
                        .foregroundStyle(
                            bool(of: fruit, in: &visibleFruits) ? ForegroundStyle.foreground.opacity(1.0) : ForegroundStyle.foreground.opacity(0.2)
                        )
                }
                .tint(ForegroundStyle.foreground)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        } header: {
            Text("フルーツ")
                .listRowInsets(.init(top: 0, leading: 12, bottom: 0, trailing: 0))
        }
    }

    var facilitySection: some View {
        Section {
            ForEach(FacilityStatus.allCases) { status in
                Button {
                    toggle(status, in: &visibleFacilities)
                } label: {
                    Text(status.rawValue)
                        .bold()
                        .foregroundStyle(
                            bool(of: status, in: &visibleFacilities) ? ForegroundStyle.foreground.opacity(1.0) : ForegroundStyle.foreground.opacity(0.2)
                        )
                }
                .tint(ForegroundStyle.foreground)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        } header: {
            Text("設備状況")
                .listRowInsets(.init(top: 0, leading: 12, bottom: 0, trailing: 0))
        }
    }

    var accessSection: some View {
        Section {
            ForEach(AccessTag.allCases) { a in
                Button {
                    toggle(a, in: &visibleAccesses)
                } label: {
                    Text(a.rawValue)
                        .bold()
                        .foregroundStyle(
                            bool(of: a, in: &visibleAccesses) ? ForegroundStyle.foreground.opacity(1.0) : ForegroundStyle.foreground.opacity(0.2)
                        )
                }
                .tint(ForegroundStyle.foreground)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
        } header: {
            Text("農場へのアクセス")
                .listRowInsets(.init(top: 0, leading: 12, bottom: 0, trailing: 0))
        }
    }

    var body: some View {
        NavigationStack {
            List {
                fruitSection
                facilitySection
                accessSection
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("フィルター")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem {
                    Button("リセット") {
                        farms = MockData.allFarms
                        visibleFruits = Fruit.allCases
                        visibleFacilities = FacilityStatus.allCases
                        visibleAccesses = AccessTag.allCases
                    }
                }
            }
            .onChange(of: visibleFruits) {
                farms = farms.filter {
                    for f in visibleFruits {
                        if $0.fruitsToGrow.contains(f) {
                            return true
                        }
                    }
                    return false
                }
            }
            .onChange(of: visibleFacilities) {
                farms = farms.filter {
                    for f in visibleFacilities {
                        if $0.facilityStatus.contains(f) {
                            return true
                        }
                    }
                    return false
                }
            }
            .onChange(of: visibleAccesses) {
                farms = farms.filter {
                    for f in visibleAccesses {
                        if $0.accessTags.contains(f) {
                            return true
                        }
                    }
                    return false
                }
            }
        }
        .background(.clear)
    }

    func toggle<T: Equatable>(_ value: T, in array: inout [T]) {
        if array.contains(value) {
            array = array.filter { $0 != value }
        } else {
            array.append(value)
        }
    }

    func bool<T: Equatable>(of value: T, in array: inout [T]) -> Bool {
        return array.contains(value)
    }
}
