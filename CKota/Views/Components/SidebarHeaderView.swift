//
//  SidebarHeaderView.swift
//  CKota
//
//  Sidebar header component with app info
//

import SwiftUI

struct SidebarHeaderView: View {
    private var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    }

    var body: some View {
        HStack(spacing: 12) {
            // App Icon
            if let icon = NSApp.applicationIconImage {
                Image(nsImage: icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
            } else {
                // Fallback placeholder
                Image(systemName: "server.rack")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.ckAccent)
                    .frame(width: 36, height: 36)
                    .background(Color.ckAccent.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 6) {
                    Text("CKota")
                        .font(.headline)
                        .fontWeight(.bold)

                    Text("v\(appVersion)")
                        .font(.system(size: 10, weight: .semibold, design: .monospaced))
                        .foregroundStyle(Color.ckMutedForeground)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 1)
                        .background(Color.ckMuted)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Text("AI Proxy Manager")
                    .font(.caption)
                    .foregroundStyle(Color.ckMutedForeground)
            }

            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 12)
    }
}

// MARK: - Powered By Button

struct PoweredByButton: View {
    @Environment(\.openURL) private var openURL

    var body: some View {
        Button {
            if let url = URL(string: "https://claudekit.cc/?ref=ELCA8NAZ") {
                openURL(url)
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "sparkles")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color.ckAccent)

                Text("Powered by ")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.ckMutedForeground)

                Image("claudekit")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 14)
            }
            .lineLimit(1)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.ckMuted)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.ckBorder, lineWidth: 0.5)
            )
        }
        .buttonStyle(.plain)
        .ckCursorPointer()
        .help("Powered by ClaudeKit")
    }
}

// MARK: - Sponsor Button

struct SponsorButton: View {
    @Environment(\.openURL) private var openURL
    private let sponsorColor = Color(hex: "DB61A2") // GitHub sponsor pink

    var body: some View {
        Button {
            if let url = URL(string: "https://github.com/sponsors/Csynnh") {
                openURL(url)
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 12))
                    .foregroundStyle(sponsorColor)

                Text("Sponsor")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(sponsorColor)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(sponsorColor.opacity(0.1))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(sponsorColor.opacity(0.3), lineWidth: 0.5)
            )
        }
        .buttonStyle(.plain)
        .ckCursorPointer()
        .help("Sponsor this project")
    }
}

#Preview {
    SidebarHeaderView()
}
