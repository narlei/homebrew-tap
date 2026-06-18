cask "claudecodenotify" do
  version "1.4.0"
  sha256 "213a483fdc35b2e8e975c5ad170a2e057cbe7addd94e3c83b6b03eb4e9d41d9e"

  url "https://github.com/narlei/claudecodenotify/releases/download/v#{version}/ClaudeCodeNotify.dmg"
  name "Claude Code Notify"
  desc "Native macOS notifications for Claude Code"
  homepage "https://github.com/narlei/claudecodenotify"

  depends_on macos: ">= :monterey"

  app "ClaudeCodeNotify.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/ClaudeCodeNotify.app"],
                   must_succeed: false
  end

  caveats do
    <<~EOS
      To complete installation, open ClaudeCodeNotify from Launchpad or Applications
      and click "Install Hook" in the status bar menu.
    EOS
  end
end
