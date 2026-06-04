cask "claudecodenotify" do
  version "1.0.3"
  sha256 "1317915dd80d1bed38b163ee9fcc107f2aff74ff3226ea3f51c7cb87ee7ae92b"

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
