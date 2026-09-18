class Wt < Formula
  desc "Git worktree manager integrated with herdr"
  homepage "https://github.com/zaratan/wt"
  version "0.1.2"
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
      sha256 "c62fd8e0bb0553e3d76a56b6fe22c2fc784ea4cf72c9f900da3047efa3d9879b"
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
