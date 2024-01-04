//
//  Image.swift
//  Wishlist
//
//  Created by Maëlys Callens on 04/01/2024.
//

import Foundation
import SwiftUI

func getAsyncImage(forCategory category: String, defaultImageUrl: String = "https://www.example.com/default-image.png") -> some View {
    AsyncImage(url: getImageUrl(forCategory: category)) { phase in
        switch phase {
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        case .failure:
            Image(systemName: "photo") // Als foto niet aanwzig is in API, dan wordt er deze foto geplaatst
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
        case .empty:
            ProgressView() // Er wordt een laadindicator toegevoegd terwijl de afbeelding wordt geladen
        @unknown default:
            EmptyView()
        }
    }
}

func getImageUrl(forCategory category: String) -> URL {
    switch category {
        case "Lego":
            return URL(string: "https://seeklogo.com/images/L/Lego-logo-749EEACA53-seeklogo.com.png")!
        case "Action Figures":
            return URL(string: "https://static.wixstatic.com/media/b69b32_171a384ce9ca42648320555cd3b1e6a0~mv2_d_1788_1508_s_2.png/v1/fill/w_400,h_336,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Action%20Figures%20Logo.png")!
        case "Dolls":
            return URL(string: "https://t4.ftcdn.net/jpg/02/33/44/49/360_F_233444947_IGX61fp5J5h8cIKB3Jgi1XWOyIW5x2q5.jpg")!
        case "Sports":
            return URL(string: "https://t4.ftcdn.net/jpg/03/02/12/83/360_F_302128359_q6aCwgAvdYZBPF4XSwxXddLPE0h3Kor1.jpg")!
        default:
            return URL(string: "https://static.vecteezy.com/system/resources/thumbnails/021/769/115/small/toys-logo-free-vector.jpg")!
    }
}
