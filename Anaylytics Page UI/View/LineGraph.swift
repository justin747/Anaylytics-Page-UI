//
//  LineGraph.swift
//  LineGraph
//
//  Created by Justin747 on 9/20/21.
//

import SwiftUI

struct LineGraph: View {
    var data: [CGFloat]
    var body: some View {
        GeometryReader { proxy in
            
            ZStack {
                
                let height = proxy.size.height
                let width = (proxy.size.width) / CGFloat(data.count)
                
                let maxPoint = (data.max() ?? 0) + 100
                
                let points = data.enumerated().compactMap { item ->
                    CGPoint in
                    
                    let progress = item.element / maxPoint
                    
                    let pathHeight = progress * height
                    
                    let pathWidth = width * CGFloat(item.offset)
                    
                    return CGPoint(x: pathWidth, y: -pathHeight + height)
                    
                }
                
                Path { path in
                    
                    path.move(to: CGPoint(x: 0, y: 0))
                    
                    path.addLines(points)
                    
                }
                .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .fill(
                
                    LinearGradient(colors: [
                    
                        Color("Gradient1"),
                        Color("Gradient2")
                    
                    ], startPoint: .leading, endPoint: .trailing)
                
                )
                
            }
        }
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
