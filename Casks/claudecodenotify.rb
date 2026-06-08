cask "claudecodenotify" do
  version "1.1.3"
  sha256 "4bfeed461390e38c719b417f9906f408739833f1d7f4e461f8d70ce4e38c2dc4"

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
