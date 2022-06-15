//
//  SearchModeView.swift
//  databaseFinal
//
//  Created by Kris on 6/16/22.
//

import SwiftUI

struct SearchModeView: View
{
    @Binding var selectedIndex: Int
    
    let searchMode = ["以學號搜尋", "以選課代碼搜尋", "以課程名稱搜尋"]
    
    var body: some View
    {
        Picker("搜尋模式", selection: $selectedIndex)
        {
            Text(searchMode[0])
                .tag(0)
            Text(searchMode[1])
                .tag(1)
            Text(searchMode[2])
                .tag(2)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct SearchModeView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchModeView(selectedIndex: .constant(0))
    }
}
