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
                let width = (proxy.size.width) / CGFloat(data.count - 1)
                
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
                
                FillBackground()
                
                    .clipShape(
                    
                        Path { path in
                            
                            path.move(to: CGPoint(x: 0, y: 0))
                            
                            path.addLines(points)
                            
                            path.addLine(to: CGPoint(x: proxy.size.width, y: height))
                            
                            path.addLine(to: CGPoint(x: 0, y: height))
                        }
                    
                    )
            }
        }
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder
    func FillBackground() -> some View {
        
        LinearGradient(colors: [
        
            Color("Gradient2")
                .opacity(0.3),
            Color("Gradient2")
                .opacity(0.2),
            Color("Gradient2")
                .opacity(0.1)]
            + Array(repeating: Color("Gradient1")
                .opacity(0.1), count: 4)
            + Array(repeating:
                Color.clear, count: 2)
            , startPoint: .top, endPoint: .bottom)
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
