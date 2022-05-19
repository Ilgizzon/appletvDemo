//
//  CategoriesResponse.swift
//  DemoTVAPP
//
//  Created by Ilgiz Fazlyev on 17.05.2022.
//

class MockCategoriesResponse {
    
    static func generate() ->CategoriesResponse {
        
        let header1 = Category(
            id: 1,
            title: "DC",
            description: "DC desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/batman-v-superman.jpeg",
            featured: true
        )
        
        let header2 = Category(
            id: 2,
            title: "Cartoon",
            description: "Cartoon desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/DragonBall.jpg",
            featured: true
        )
        
        let header3 = Category(
            id: 3,
            title: "Marvel",
            description: "Marvel desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/IronMan3.jpg",
            featured: true
        )
        
        let dc = Category(
            id: 4,
            title: "DC",
            description: "DC desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/batman-v-superman.jpeg",
            featured: false
        )
        
        let cartoon = Category(
            id: 5,
            title: "Cartoon",
            description: "Cartoon desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/DragonBall.jpg",
            featured: false
        )
        
        let marvel = Category(
            id: 6,
            title: "Marvel",
            description: "Marvel desc",
            image: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/IronMan3.jpg",
            featured: false
        )
        
        return CategoriesResponse(categories: [header1, header2, header3, dc, cartoon, marvel])
    }
}
struct CategoriesResponse {
    let categories: [Category]?
}

struct Category {
    let id: Int
    let title: String?
    let description: String?
    let image: String?
    let featured: Bool
}
