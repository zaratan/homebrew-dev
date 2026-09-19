class Wt < Formula
  desc "Git worktree manager integrated with herdr"
  homepage "https://github.com/zaratan/wt"
  version "0.2.0"
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
      sha256 "1ed055243f47d927b7d3f215a15e74798d59d70470fa38ea97518ac727d545af"
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
