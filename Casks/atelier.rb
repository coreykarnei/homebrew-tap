cask "atelier" do
  version "1.4.2"
  sha256 "24e992bf63f6200eb9a128983097c752f0f6ae613c3e27580ec66b5141128a06"

  url "https://github.com/coreykarnei/atelier/releases/download/v#{version}/Atelier-#{version}.zip"
  name "Atelier"
  desc "Workspace for agent-assisted coding: editor, shell, and Claude Code"
  homepage "https://github.com/coreykarnei/atelier"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Atelier.app"
  # The workspace CLI ships inside the bundle as atelier-cli: on APFS,
  # MacOS/atelier would case-collide with the app binary MacOS/Atelier.
  binary "#{appdir}/Atelier.app/Contents/MacOS/atelier-cli", target: "atelier"

  uninstall quit: "dev.sterlingcore.atelier"

  zap trash: [
    "~/.local/state/atelier",
    "~/Library/Caches/dev.sterlingcore.atelier",
    "~/Library/HTTPStorages/dev.sterlingcore.atelier",
    "~/Library/Preferences/dev.sterlingcore.atelier.plist",
    "~/Library/Saved Application State/dev.sterlingcore.atelier.savedState",
  ]

  caveats <<~EOS
    Atelier hosts Claude Code; install it and confirm `claude` runs in your
    terminal first. Notification hooks, language servers and remote sessions
    are covered in docs/SETUP.md in the repository.
  EOS
end
