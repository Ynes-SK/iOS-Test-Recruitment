//
//  ImageView.swift
//  TheGoodCorner
//
//  Created by Ines SK on 18.09.26.
//

import SwiftUI

struct ImageView: View {
    let url: String?

    var body: some View {
        AsyncImage(url: URL(string: "http://localhost:8080\(url ?? "")")) { imageStatus in
            switch imageStatus {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()

            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()

            @unknown default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .clipped()
    }
}
