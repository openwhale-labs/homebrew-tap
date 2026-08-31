cask "scrubjay" do
  version "0.1.2"
  sha256 "05027157f970d6181c0fd3b72f69d4194200af8d5eac696c2413e636ca8cb641"

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
