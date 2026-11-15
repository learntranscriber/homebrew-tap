cask "learntranscriber" do
  version "0.1.4"
  sha256 "b2a76d563fb2caa146ef697ba9f2eef2b0de8ea5a29c63fab802a2c569f2b721"

  url "https://github.com/DeVFirmino/learntranscriber/releases/download/v#{version}/LearnTranscriber-arm64.dmg"
  name "LearnTranscriber"
  desc "Live transcription and an AI study assistant for classes and calls"
  homepage "https://learntranscriber.danieldias.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
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
