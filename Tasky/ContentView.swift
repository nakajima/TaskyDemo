//
//  ContentView.swift
//  Tasky
//
//  Created by Pat Nakajima on 4/23/24.
//

import SwiftUI

struct TaskyView: View {
	var i: Int

	@State var label: String = ""

	var body: some View {
		Text("\(i): " + label)
			.task {
				while true {
					do {
						try await Task.sleep(for: .seconds(1))
						label = "\(Date().formatted(date: .omitted, time: .complete))"
						print("\(i): " + label)
					} catch {
						print("Canceled task \(i)")
						break
					}
				}
			}
			.id(i)
	}
}

struct ContentView: View {
	@State private var i = 1
	var body: some View {
			VStack {
				TaskyView(i: i)
				Button("Update \(i)") {
					i += 1
				}
			}
			.padding()
	}
}

#Preview {
    ContentView()
}
