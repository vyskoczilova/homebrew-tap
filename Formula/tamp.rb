class Tamp < Formula
  desc "Keep your Mac awake — menu bar app + CLI around macOS caffeinate"
  homepage "https://github.com/vyskoczilova/tamp"
  url "https://github.com/vyskoczilova/tamp/releases/download/v1.0.2/tamp-1.0.2-macos.zip"
  sha256 "608c54fe17cda0f74028e05147c3e0224951507e9acb8060f5dd2da648b250bb"
  version "1.0.2"
  license "MIT"

  depends_on macos: :ventura

  def install
    bin.install "tamp"
    prefix.install "Tamp.app"
    generate_completions_from_executable(bin/"tamp", "--generate-completion-script")
  end

  def caveats
    <<~EOS
      To use the menu bar app, copy it to /Applications (copy, not symlink —
      launch-at-login needs a stable real path):

        cp -R "#{opt_prefix}/Tamp.app" /Applications/
        open /Applications/Tamp.app

      To fully remove Tamp later (app, login item, state, preferences), see:
        https://github.com/vyskoczilova/homebrew-tap#uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tamp --version")
  end
end
