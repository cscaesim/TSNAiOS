//
//  ReportsView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct ReportCell: View {
    var report: Report
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(report.imageUrl).frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(report.title)
                .font(.caption)
                .frame(width: 155)
        }
        .padding(.leading)
    }
}

struct ReportRow: View {
    var reports: [Report]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reports")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(reports, id: \.self) { report in
                        ReportCell(report: report)
                    }
                }
            })
           
        }
    }

}