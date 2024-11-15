//
//  FarmData.swift
//  TeamB
//
//  Created by Yuki Kuwashima on 2024/11/16.
//

import Foundation

// 農場
struct Farm: Codable, Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var photoName: String
    var location: Location
    var farmer: Farmer
    var commentFromFarmer: String
    var fruitsToGrow: [Fruit]
    var facilityStatus: [FacilityStatus]
    var accessTags: [AccessTag]
    var contactInfo: ContactInfo
}

// 農場の場所
struct Location: Codable, Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var addressName: String
    var lat: Double
    var lon: Double
}

// 農家の人
struct Farmer: Codable, Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var photoName: String
}

// 育てる果物
enum Fruit: String, Codable, Identifiable, Equatable, Hashable, CaseIterable {
    var id: String { self.rawValue }
    case shineMuscuit = "シャインマスカット"
    case peach = "もも"
    case plum = "すもも"
    case grape = "ぶどう"
    case persimmon = "柿"
    case cherry = "さくらんぼ"
    case apple = "りんご"
}

// 設備状況
enum FacilityStatus: String, Codable, Identifiable, Equatable, Hashable, CaseIterable {
    var id: String { self.rawValue }
    case waterSupply = "水道設備あり"
    case electricity = "電気設備あり"
    case machinery = "農業機械あり"
    case restArea = "休憩スペースあり"
    case airConditionedRestArea = "エアコン付き休憩所あり"
    case diningArea = "食事スペースあり"
    case toilet = "トイレあり"
    case toiletCleaned = "トイレ清掃済み"
    case parking = "駐車場あり"
    case internet = "インターネット利用可能"
    case accommodation = "宿泊施設あり"
}

// 農場へのアクセス
enum AccessTag: String, Codable, Identifiable, Equatable, Hashable, CaseIterable {
    var id: String { self.rawValue }
    case nearStation = "駅近"
    case busAvailable = "バスがある"
    case freeShuttle = "送迎あり"
    case parkingAvailable = "駐車場あり"
    case ruralArea = "田舎"
}

// 連絡先情報
struct ContactInfo: Codable, Identifiable, Equatable, Hashable {
    var id: String = UUID().uuidString
    var phoneNumber: String
    var mailAddress: String
}

enum MockData {
    static let allFarms: [Farm] = [
        farm1,
        farm2,
        farm3,
        farm4,
        farm5,
        farm6,
        farm7,
        farm8,
        farm9,
        farm10,
        farm11,
        farm12,
        farm13,
        farm14,
        farm15,
        farm16,
    ]
    static let farm1: Farm = Farm(
        id: UUID().uuidString,
        name: "甲府シャイン農園",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲府市青葉町",
            lat: 35.6631,
            lon: 138.5683
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "山田太郎",
            photoName: "farmer1"
        ),
        commentFromFarmer: "シャインマスカットが自慢の農園です！ぜひ遊びに来てください。",
        fruitsToGrow: [.shineMuscuit, .grape],
        facilityStatus: [.waterSupply, .toilet, .parking],
        accessTags: [.nearStation, .parkingAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm2: Farm = Farm(
        id: UUID().uuidString,
        name: "桃源郷ファーム",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県笛吹市桃園町",
            lat: 35.6483,
            lon: 138.6405
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "佐藤花子",
            photoName: "farmer2"
        ),
        commentFromFarmer: "甘くてジューシーなももを栽培しています！初心者でも安心して働けます。",
        fruitsToGrow: [.peach, .plum],
        facilityStatus: [.electricity, .restArea, .internet],
        accessTags: [.busAvailable, .freeShuttle],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm3: Farm = Farm(
        id: UUID().uuidString,
        name: "塩山りんご園",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲州市塩山町",
            lat: 35.7181,
            lon: 138.7402
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "高橋一郎",
            photoName: "farmer1"
        ),
        commentFromFarmer: "秋はりんご狩りが楽しめます！収穫の魅力を体験してください。",
        fruitsToGrow: [.apple, .persimmon],
        facilityStatus: [.accommodation, .airConditionedRestArea],
        accessTags: [.ruralArea, .parkingAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm4: Farm = Farm(
        id: UUID().uuidString,
        name: "勝沼ぶどうファーム",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲州市勝沼町",
            lat: 35.7051,
            lon: 138.6879
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "藤井美智子",
            photoName: "farmer2"
        ),
        commentFromFarmer: "世界でも評価の高いぶどうを一緒に育ててみませんか？",
        fruitsToGrow: [.grape, .shineMuscuit],
        facilityStatus: [.waterSupply, .diningArea, .toiletCleaned],
        accessTags: [.freeShuttle, .nearStation],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )
    static let farm5: Farm = Farm(
        id: UUID().uuidString,
        name: "南アルプスさくらんぼ園",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県南アルプス市桜町",
            lat: 35.6061,
            lon: 138.4915
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "中村優子",
            photoName: "farmer1"
        ),
        commentFromFarmer: "さくらんぼ狩りで有名な農園です！みんなで楽しく働きましょう。",
        fruitsToGrow: [.cherry, .peach],
        facilityStatus: [.waterSupply, .restArea],
        accessTags: [.busAvailable, .ruralArea],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm6: Farm = Farm(
        id: UUID().uuidString,
        name: "北杜柿園",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県北杜市柿生町",
            lat: 35.7567,
            lon: 138.4147
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "小林健一",
            photoName: "farmer2"
        ),
        commentFromFarmer: "秋の柿の収穫を楽しみながら働けます！",
        fruitsToGrow: [.persimmon, .plum],
        facilityStatus: [.parking, .electricity],
        accessTags: [.nearStation, .freeShuttle],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm7: Farm = Farm(
        id: UUID().uuidString,
        name: "富士りんごファーム",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県富士吉田市りんご町",
            lat: 35.5012,
            lon: 138.7645
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "松本洋平",
            photoName: "farmer1"
        ),
        commentFromFarmer: "富士山のふもとでりんご栽培！気持ちの良い環境で働けます。",
        fruitsToGrow: [.apple, .grape],
        facilityStatus: [.accommodation, .toiletCleaned],
        accessTags: [.ruralArea, .busAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm8: Farm = Farm(
        id: UUID().uuidString,
        name: "大月シャインファーム",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県大月市シャイン町",
            lat: 35.6101,
            lon: 138.9332
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "藤田香織",
            photoName: "farmer2"
        ),
        commentFromFarmer: "人気のシャインマスカットを一緒に育てましょう！",
        fruitsToGrow: [.shineMuscuit, .peach],
        facilityStatus: [.waterSupply, .diningArea],
        accessTags: [.nearStation, .parkingAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm9: Farm = Farm(
        id: UUID().uuidString,
        name: "甲府プラムガーデン",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲府市プラム町",
            lat: 35.6702,
            lon: 138.5639
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "安藤誠",
            photoName: "farmer1"
        ),
        commentFromFarmer: "おいしいプラムを一緒に育ててみませんか？",
        fruitsToGrow: [.plum, .cherry],
        facilityStatus: [.internet, .restArea],
        accessTags: [.busAvailable, .ruralArea],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )
    static let farm10: Farm = Farm(
        id: UUID().uuidString,
        name: "韮崎桃ファーム",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県韮崎市桃園町",
            lat: 35.6761,
            lon: 138.4491
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "岡本真由美",
            photoName: "farmer1"
        ),
        commentFromFarmer: "甘くて香り豊かな桃の収穫をお手伝いください！",
        fruitsToGrow: [.peach, .persimmon],
        facilityStatus: [.waterSupply, .parking],
        accessTags: [.freeShuttle, .busAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm11: Farm = Farm(
        id: UUID().uuidString,
        name: "都留ぶどう園",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県都留市ぶどう町",
            lat: 35.5512,
            lon: 138.8845
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "武田和也",
            photoName: "farmer2"
        ),
        commentFromFarmer: "地元で評判のぶどう農園です。一緒に働きませんか？",
        fruitsToGrow: [.grape, .shineMuscuit],
        facilityStatus: [.diningArea, .restArea],
        accessTags: [.parkingAvailable, .nearStation],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm12: Farm = Farm(
        id: UUID().uuidString,
        name: "勝沼柿ファーム",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲州市勝沼町柿生",
            lat: 35.7222,
            lon: 138.7289
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "三井愛子",
            photoName: "farmer1"
        ),
        commentFromFarmer: "特産の甘い柿を一緒に収穫しませんか？",
        fruitsToGrow: [.persimmon, .apple],
        facilityStatus: [.accommodation, .toilet],
        accessTags: [.ruralArea, .busAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm13: Farm = Farm(
        id: UUID().uuidString,
        name: "甲府さくらんぼ農園",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲府市桜町",
            lat: 35.6541,
            lon: 138.5593
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "石田剛",
            photoName: "farmer2"
        ),
        commentFromFarmer: "春の収穫体験は特に人気です！さくらんぼ狩りを楽しみながら働けます。",
        fruitsToGrow: [.cherry, .plum],
        facilityStatus: [.electricity, .internet],
        accessTags: [.nearStation, .freeShuttle],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm14: Farm = Farm(
        id: UUID().uuidString,
        name: "南部プラムガーデン",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県南部町プラム台",
            lat: 35.4751,
            lon: 138.4311
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "村田彩子",
            photoName: "farmer1"
        ),
        commentFromFarmer: "おいしいプラムを一緒に栽培しましょう！初心者でも大歓迎です。",
        fruitsToGrow: [.plum, .peach],
        facilityStatus: [.restArea, .diningArea],
        accessTags: [.parkingAvailable, .ruralArea],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm15: Farm = Farm(
        id: UUID().uuidString,
        name: "笛吹シャイン園",
        photoName: "farm2",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県笛吹市シャイン台",
            lat: 35.6488,
            lon: 138.6324
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "木下涼",
            photoName: "farmer2"
        ),
        commentFromFarmer: "シャインマスカットを育てる楽しさを感じてください！",
        fruitsToGrow: [.shineMuscuit, .grape],
        facilityStatus: [.waterSupply, .airConditionedRestArea],
        accessTags: [.busAvailable, .nearStation],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )

    static let farm16: Farm = Farm(
        id: UUID().uuidString,
        name: "甲州りんごの郷",
        photoName: "farm1",
        location: Location(
            id: UUID().uuidString,
            addressName: "山梨県甲州市りんご台",
            lat: 35.7252,
            lon: 138.7455
        ),
        farmer: Farmer(
            id: UUID().uuidString,
            name: "原田博之",
            photoName: "farmer1"
        ),
        commentFromFarmer: "りんごを一緒に育てませんか？秋が見どころです！",
        fruitsToGrow: [.apple, .cherry],
        facilityStatus: [.accommodation, .toiletCleaned],
        accessTags: [.ruralArea, .parkingAvailable],
        contactInfo: ContactInfo(phoneNumber: "xxx-xxxx-xxxx", mailAddress: "xxxxxxxx@xxxxx.xxx")
    )
}
