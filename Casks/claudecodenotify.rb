cask "claudecodenotify" do
  version "1.0.2"
  sha256 "1aed0be2350c0c8e884b506f943531c0b06a9a2581049d7088f128ccbf5f9cb6"

  url "https://github.com/narlei/claudecodenotify/releases/download/v#{version}/ClaudeCodeNotify.dmg"
  name "Claude Code Notify"
  desc "Native macOS notifications for Claude Code"
  homepage "https://github.com/narlei/claudecodenotify"

  depends_on macos: ">= :ventura"

  app "ClaudeCodeNotify.app"

  caveats do
    requires_rosetta
    <<~EOS
      To complete installation, open ClaudeCodeNotify from Launchpad or Applications
      and click "Install Hook" in the status bar menu.
    EOS
  end
end
