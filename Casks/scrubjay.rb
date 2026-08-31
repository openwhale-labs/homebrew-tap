cask "scrubjay" do
  version "0.1.1"
  sha256 "a242e0ab1c3f1f7affcfa85095e4e7be4452046f50718f1dd759ad4706a9738c"

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
