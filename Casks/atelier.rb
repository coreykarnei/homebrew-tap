cask "atelier" do
  version "1.2.0"
  sha256 "bbcb55f7d985ad70b5a21497cfa918f8e745480a78d3cd3a61676f55354f1294"

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
    Atelier is signed with a self-signed certificate, not a Developer ID,
    and is not notarized. macOS will refuse the first launch. Either:

      Open System Settings -> Privacy & Security, then "Open Anyway", or
      xattr -dr com.apple.quarantine "#{appdir}/Atelier.app"

    To skip that entirely, reinstall with:

      brew install --cask --no-quarantine coreykarnei/tap/atelier

    Atelier hosts Claude Code; install it and confirm `claude` runs in your
    terminal first. Notification hooks, language servers and remote sessions
    are covered in docs/SETUP.md in the repository.
  EOS
end
