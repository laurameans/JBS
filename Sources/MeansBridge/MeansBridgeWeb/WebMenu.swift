//
//  File.swift
//  
//
//  Created by Justin Means on 10/22/23.
//

import Foundation

@PublicInit
public struct WebMenu: DTO {
    public var elements: [WebMenu.Element]
    public var lightLogoImageURL: String?
    public var darkLogoImageURL: String?
    
    @PublicInit
    public struct Element: DTO {
        public let id: UUID
        public var title: String
        public var link: String
    }
}

let headerSample = """
{
    "elements": [
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B176",
            "title": "Home",
            "link": "/"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B177",
            "title": "Guides",
            "link": "/guides"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B178",
            "title": "Updates",
            "link": "/updates"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B179",
            "title": "Help",
            "link": "/help"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B170",
            "title": "Download",
            "link": "/download"
        },
    ],
    "lightLogoImageURL": "https://cdn.outtakes.com/2023/08/Means-nardo-l.png",
    "darkLogoImageURL": "https://cdn.outtakes.com/2023/08/Means-nardo-l.png"
}
"""

let footerSample = """
{
    "elements": [
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B176",
            "title": "About",
            "link": "/about"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B177",
            "title": "Careers",
            "link": "/careers"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B178",
            "title": "Developer API",
            "link": "/developer"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B179",
            "title": "Press",
            "link": "/press"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B170",
            "title": "Privacy Policy",
            "link": "/privacy"
        },
        {
            "id": "F9186013-7BB6-4718-8095-8B69B688B175",
            "title": "Terms and Conditions",
            "link": "/terms"
        },
    ],
    "lightLogoImageURL": "https://cdn.outtakes.com/2023/08/means-ai.png",
    "darkLogoImageURL": "https://cdn.outtakes.com/2023/08/means-ai.png"
}
"""
//"https://cdn.outtakes.com/2023/08/means-ai.png"
