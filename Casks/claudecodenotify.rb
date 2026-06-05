cask "claudecodenotify" do
  version "1.1.1"
  sha256 "1d6c8c60ec2e14c46d1acba0f813978592e6ac0ff61322356f88ce1af5a1ee0a"

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
