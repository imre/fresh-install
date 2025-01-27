//
//  ContentView.swift
//  Fresh Install
//
//  Created by Imre Draskovits on 27/01/2025.
//

import SwiftUI

// Domain Models
struct Package: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let type: PackageType
    var isSelected: Bool = false
    var isInstalled: Bool = false
}

enum PackageType: String {
    case brew = "Homebrew Package"
    case cask = "Homebrew Cask"
    case other = "Custom Package"
    
    var command: String {
        switch self {
        case .brew: return "brew install"
        case .cask: return "brew install --cask"
        case .other: return "custom"
        }
    }
}

// View Models
class InstallerViewModel: ObservableObject {
    @Published var packages: [Package] = [
        Package(name: "git", type: .brew),
        Package(name: "python", type: .brew),
        Package(name: "node", type: .brew),
        Package(name: "visual-studio-code", type: .cask),
        Package(name: "docker", type: .cask)
    ]
    
    @Published var installationStatus: String = ""
    
    func installSelected() {
        let selected = packages.filter { $0.isSelected }
        guard !selected.isEmpty else { return }
        
        Task {
            await installPackages(selected)
        }
    }
    
    @MainActor
    private func installPackages(_ packages: [Package]) async {
        for package in packages {
            installationStatus = "Installing \(package.name)..."
            
            let command = package.type.command
            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/bin/zsh")
            process.arguments = ["-c", "\(command) \(package.name)"]
            
            do {
                try process.run()
                process.waitUntilExit()
                
                if process.terminationStatus == 0 {
                    if let index = self.packages.firstIndex(where: { $0.id == package.id }) {
                        self.packages[index].isInstalled = true
                    }
                }
            } catch {
                installationStatus = "Error installing \(package.name): \(error.localizedDescription)"
            }
        }
        
        installationStatus = "Installation complete!"
    }
}

// Views
struct ContentView: View {
    @StateObject private var viewModel = InstallerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("macOS Software Installer")
                .font(.title)
            
            List {
                ForEach($viewModel.packages) { $package in
                    PackageRow(package: $package)
                }
            }
            .frame(height: 300)
            
            Button("Install Selected") {
                viewModel.installSelected()
            }
            .disabled(viewModel.packages.filter(\.isSelected).isEmpty)
            
            Text(viewModel.installationStatus)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(width: 400, height: 400)
    }
}

struct PackageRow: View {
    @Binding var package: Package
    
    var body: some View {
        HStack {
            Toggle("", isOn: $package.isSelected)
            
            VStack(alignment: .leading) {
                Text(package.name)
                Text(package.type.rawValue)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if package.isInstalled {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}
