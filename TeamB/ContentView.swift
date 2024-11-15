//
//  ContentView.swift
//  TeamB
//
//  Created by Yuki Kuwashima on 2024/11/15.
//

import SwiftUI

struct ContentView: View {

    @State var showFilter: Bool = false
    @State var farms: [Farm] = MockData.allFarms
    @State var visibleFruits: [Fruit] = Fruit.allCases
    @State var visibleFacilities: [FacilityStatus] = FacilityStatus.allCases
    @State var visibleAccesses: [AccessTag] = AccessTag.allCases

    @State var selectedFarm: Farm?

    var body: some View {
        NavigationStack {
            List(farms) { farm in
                HStack(spacing: 10) {
                    Image(farm.photoName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100)
                        .clipShape(RoundedRectangle(cornerSize: .init(width: 20, height: 20)))
                    VStack(alignment: .leading) {
                        Text(farm.name)
                            .font(.title2)
                            .bold()
                        Text(farm.commentFromFarmer)
                            .font(.footnote)
                            .foregroundStyle(.foreground.opacity(0.6))
                        Spacer()
                        HStack {
                            Text(farm.location.addressName)
                                .font(.caption2)
                                .foregroundStyle(.foreground.opacity(0.6))
                            Spacer()
                            Text(Date().formatted(.dateTime.year().month().day()))
                                .font(.caption2)
                                .foregroundStyle(.foreground.opacity(0.6))
                        }
                    }
                }
                .onTapGesture {
                    selectedFarm = farm
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .frame(height: 100)
            }
            .navigationDestination(item: $selectedFarm) { farm in
                FarmDetailView(farm: farm)
            }
            .navigationTitle("農場一覧")
            .toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem {
                    Button("フィルター") {
                        showFilter = true
                    }
                }
            }
            .sheet(isPresented: $showFilter) {
                FilterView(
                    farms: $farms,
                    visibleFruits: $visibleFruits,
                    visibleFacilities: $visibleFacilities,
                    visibleAccesses: $visibleAccesses
                )
                .presentationBackground(.ultraThinMaterial)
                .presentationDetents([.medium])
            }
        }
        .background(.clear)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    ContentView()
}
