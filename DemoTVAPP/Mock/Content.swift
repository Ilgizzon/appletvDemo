//
//  Content.swift
//  DemoTVAPP
//
//  Created by Ilgiz Fazlyev on 18.05.2022.
//

class MockContent {
    
    static func generate(id : Int) ->[Content] {
        switch id {
        case 4:
            return MockContent.dcMock()
        case 5:
            return MockContent.cartoonMock()
        case 6:
            return MockContent.marvelMock()
        default:
            return []
        }
        
    }
    
    static func dcMock() ->[Content] {
        let aquaman = Content(
            id: 10,
            contentType: .video,
            title: "Aquaman",
            duration: 8580,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/Aquaman.jpg",
            childrenCount: 0
        )
        
        let batmanVSuperman = Content(
            id: 11,
            contentType: .liveEvent,
            title: "Batman v Superman",
            duration: 9180,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/batman-v-superman.jpeg",
            childrenCount: 0
        )
        
        let justiceLeague = Content(
            id: 12,
            contentType: .video,
            title: "Justice League",
            duration: 6600,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/justice_league.jpg",
            childrenCount: 0
        )
        
        let shazam = Content(
            id: 13,
            contentType: .video,
            title: "Shazam!",
            duration: 7920,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/shazam.jpg",
            childrenCount: 0
        )
        
        let wonderWoman = Content(
            id: 14,
            contentType: .collection,
            title: "Wonder Woman",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/DC/wonder-woman.jpg",
            childrenCount: 3
        )
        
        return [aquaman, batmanVSuperman, justiceLeague, shazam, wonderWoman]
    }
    
    static func marvelMock() ->[Content] {
        let antMan2 = Content(
            id: 15,
            contentType: .collection,
            title: "Ant-Man and the Wasp",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/Ant-Man2.jpg",
            childrenCount: 2
        )
        
        let blackPanther = Content(
            id: 16,
            contentType: .video,
            title: "Batman v Superman",
            duration: 8040,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/BlackPanther.jpg",
            childrenCount: 0
        )
        
        let ironMan3 = Content(
            id: 17,
            contentType: .collection,
            title: "Iron Man 3",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/IronMan3.jpg",
            childrenCount: 3
        )
        
        let thorRagnarok = Content(
            id: 18,
            contentType: .video,
            title: "Thor: Ragnarok",
            duration: 7200,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/ThorRagnarok.jpg",
            childrenCount: 0
        )
        
        let guardiansOfTheGalaxy = Content(
            id: 19,
            contentType: .liveEvent,
            title: "Guardians of the Galaxy Vol. 2",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Marvel/guardians-of-the-galaxy-vol-2.jpg",
            childrenCount: 3
        )
        
        return [antMan2, blackPanther, ironMan3, thorRagnarok, guardiansOfTheGalaxy]
    }
    
    static func cartoonMock() ->[Content] {
        let bobSBurgers = Content(
            id: 20,
            contentType: .collection,
            title: "Bob's Burgers",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/BobSBurgers.jpg",
            childrenCount: 55
        )
        
        let dragonBall = Content(
            id: 21,
            contentType: .collection,
            title: "Dragon Ball",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/DragonBall.jpg",
            childrenCount: 136
        )
        
        let mrBean = Content(
            id: 22,
            contentType: .liveEvent,
            title: "Mr. Bean",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/MrBean.jpg",
            childrenCount: 3
        )
        
        let girls = Content(
            id: 23,
            contentType: .collection,
            title: "The Powerpuff Girls",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/PowerPuffGirls.jpg",
            childrenCount: 6
        )
        
        let simpsons = Content(
            id: 24,
            contentType: .liveEvent,
            title: "The Simpsons",
            duration: 0,
            description: "",
            preview: "https://raw.githubusercontent.com/Ilgizzon/appletvDemo/main/Mock/Cartoon/homer.jpg",
            childrenCount: 3
        )
        
        return [bobSBurgers, dragonBall, mrBean, girls, simpsons]
    }
}

struct Content {
    public let id: Int
    public let contentType: ContentType?
    public let title: String?
    public let duration: Int?
    public let description: String?
    public let preview: String?
    public let childrenCount: Int?


}

public enum ContentType: String {
    case liveEvent = "live_event"
    case collection = "collection"
    case video = "video"
}
