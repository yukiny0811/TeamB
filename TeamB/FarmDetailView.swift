//
//  FarmDetailView.swift
//  TeamB
//
//  Created by Yuki Kuwashima on 2024/11/16.
//

import SwiftUI
import MapKit

struct FarmDetailView: View {
    let farm: Farm
    var body: some View {
        NavigationStack {
            List {
                Image(farm.photoName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                HStack(alignment: .center) {
                    Image(farm.farmer.photoName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    VStack(alignment: .leading, spacing: 6) {
                        Text(farm.farmer.name)
                            .font(.title3)
                            .bold()
                        Text(farm.commentFromFarmer)
                            .font(.footnote)
                            .foregroundStyle(.foreground.opacity(0.7))
                    }
                }
                .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

                Section("育てているフルーツ") {
                    ForEach(farm.fruitsToGrow) { fruit in
                        Text(fruit.rawValue)
                            .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                    }
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

                Section("設備") {
                    ForEach(farm.facilityStatus) { status in
                        Text(status.rawValue)
                            .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                    }
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

                Section {
                    ForEach(farm.accessTags) { tag in
                        Text(tag.rawValue)
                            .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                    }
                } header: {
                    HStack {
                        Text("農園へのアクセス")
                        Spacer()
                        Text("住所: \(farm.location.addressName)")
                    }

                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

                Section("連絡先") {
                    Text(farm.contactInfo.phoneNumber)
                        .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                    Text(farm.contactInfo.mailAddress)
                        .listRowInsets(.init(top: 16, leading: 16, bottom: 16, trailing: 16))
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))

                Section("アクセスマップ") {
                    Map(
                        position: .constant(
                            .camera(
                                .init(
                                    centerCoordinate: .init(
                                        latitude: farm.location.lat,
                                        longitude: farm.location.lon
                                    ),
                                    distance: 100
                                )
                            )
                        )
                    ) {
                        Annotation(
                            farm.name,
                            coordinate: .init(
                                latitude: farm.location.lat,
                                longitude: farm.location.lon
                            )
                        ) {
                            Image(systemName: "tree.circle.fill")
                                .foregroundStyle(.green)
                        }
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 16, height: 16)))
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .navigationTitle(farm.name)
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    FarmDetailView(farm: MockData.farm1)
}
