class Wt < Formula
  desc "Git worktree manager integrated with herdr"
  homepage "https://github.com/zaratan/wt"
  version "0.1.1"
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
      sha256 "47e910e29d9978a8d12d1a05ac6c65d4b5a990ceca0ec8e9356fbc913d4c3e42"
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
