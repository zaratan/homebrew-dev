class Wt < Formula
  desc "Git worktree manager integrated with herdr"
  homepage "https://github.com/zaratan/wt"
  version "0.2.1"
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
      sha256 "7c608ce1ab70a63ae2e7ef3346c457cdda8ab18833d7715de5b2b90d676f8e13"
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
