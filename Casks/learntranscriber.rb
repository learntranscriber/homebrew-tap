cask "learntranscriber" do
  arch arm: "arm64", intel: "x64"

  version "0.1.5"
  sha256 arm:   "19caaeb1d17c26dcd61ebc3fb5205099f969e52dbe1d2219c5d0d6a872327274",
         intel: "3883f2eb2d23689c2a719caf206e0bdf1f3096c967b538175d4fb4db52c280c6"

  url "https://github.com/DeVFirmino/learntranscriber/releases/download/v#{version}/LearnTranscriber-#{arch}.dmg"
  name "LearnTranscriber"
  desc "Live transcription and an AI study assistant for classes and calls"
  homepage "https://learntranscriber.danieldias.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "LearnTranscriber.app"

  zap trash: [
    "~/Library/Application Support/LearnTranscriber",
    "~/Library/Logs/LearnTranscriber",
    "~/Library/Preferences/dev.danieldias.learntranscriber.plist",
    "~/Library/Saved Application State/dev.danieldias.learntranscriber.savedState",
  ]

  caveats <<~EOS
    LearnTranscriber is not notarized by Apple, so macOS blocks its first launch.
    Open System Settings > Privacy & Security, choose Open Anyway next to
    LearnTranscriber, and confirm with your password. Later launches open normally.
  EOS
end
