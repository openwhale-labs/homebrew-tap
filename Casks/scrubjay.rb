cask "scrubjay" do
  version "0.1.4"
  sha256 "77a8c6d7fedad0e8aaedba74a94de6555f24abaf519c9f4e00fea6ddc2a71acc"

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
