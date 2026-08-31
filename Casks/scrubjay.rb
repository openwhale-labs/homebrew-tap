cask "scrubjay" do
  version "0.1.6"
  sha256 "6b563ed979b684f23e8477a39f605b35908e1d25214ff5154e7520ac5408f627"

  url "https://dl.openwhale.dev/scrubjay/ScrubJay-#{version}.dmg"
  name "ScrubJay"
  desc "Uninstall Mac apps together with the files they leave behind"
  homepage "https://scrubjay.openwhale.dev"

  livecheck do
    url "https://dl.openwhale.dev/scrubjay/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :sonoma"

  app "ScrubJay.app"

  uninstall launchctl: "dev.openwhale.scrubjay.helper",
            quit:      "dev.openwhale.scrubjay"

  zap trash: [
    "~/Library/Caches/dev.openwhale.scrubjay",
    "~/Library/HTTPStorages/dev.openwhale.scrubjay",
    "~/Library/Preferences/dev.openwhale.scrubjay.plist",
  ]
end
