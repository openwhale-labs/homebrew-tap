cask "scrubjay" do
  version "0.1.7"
  sha256 "944eb26aaf6cf4a0a74e8ed104ef69d9138eed83c79deb1326334efce4fa5c68"

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
