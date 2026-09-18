class Wt < Formula
  desc "Git worktree manager integrated with herdr"
  homepage "https://github.com/zaratan/wt"
  version "0.1.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/zaratan/wt/releases/download/v#{version}/wt-darwin-arm64.tar.gz"
      sha256 "1137285a86f72cb1c9c3ac83ce43a2b8e346f3a507572c60c96d8a1ff527cd08"
    end
  end

  def install
    bin.install "wt-darwin-arm64" => "wt"
  end

  def caveats
    <<~EOS
      wt drives herdr, the terminal workspace manager, and does little
      without it: https://herdr.dev

      Shell completion:
        wt completion zsh > "$(brew --prefix)/share/zsh/site-functions/_wt"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt --version")
  end
end
