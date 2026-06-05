cask "claudecodenotify" do
  version "1.1.0"
  sha256 "5ffcdc2d3528e05662401ec297326873e7664e1b669a1ba746e89f60a995361f"

  url "https://github.com/narlei/claudecodenotify/releases/download/v#{version}/ClaudeCodeNotify.dmg"
  name "Claude Code Notify"
  desc "Native macOS notifications for Claude Code"
  homepage "https://github.com/narlei/claudecodenotify"

  depends_on macos: ">= :ventura"

  app "ClaudeCodeNotify.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/ClaudeCodeNotify.app"],
                   must_succeed: false
  end

  caveats do
    requires_rosetta
    <<~EOS
      To complete installation, open ClaudeCodeNotify from Launchpad or Applications
      and click "Install Hook" in the status bar menu.
    EOS
  end
end
