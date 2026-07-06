class Tamp < Formula
  desc "Keep your Mac awake — menu bar app + CLI around macOS caffeinate"
  homepage "https://tamp.kybernaut.cz"
  url "https://github.com/vyskoczilova/tamp/releases/download/v1.0.4/tamp-1.0.4-macos.zip"
  sha256 "b43df74b371ffb395bb37d5b6c5733b8e54468fd793d5ec799feab8dec9b9642"
  version "1.0.4"
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
