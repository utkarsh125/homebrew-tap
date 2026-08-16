class Morrow < Formula
  desc "Calm, keyboard-first terminal workspace for chatting with local LLMs via Ollama"
  homepage "https://github.com/utkarsh125/morrow"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.0/morrow-aarch64-apple-darwin.tar.gz"
      sha256 "53d53081dd266a75dfe193cd11b30d28b504977373d9223d35293942a4771538"
    else
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.0/morrow-x86_64-apple-darwin.tar.gz"
      sha256 "4a6f1d1451c0966a79294cc33808193af74ab2c6bff0f1d29bf84b635bcdedb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.0/morrow-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32c88cfdf42be339632d2befb777f64cee5cd57d27e5e518e99459c30506bbc5"
    else
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.0/morrow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0c13c3af3a6b3306072dcd668592d10bc8b632c769884c73e1249321726ec15"
    end
  end

  head do
    url "https://github.com/utkarsh125/morrow.git", branch: "main"
    depends_on "rust" => :build
  end

  def install
    if build.head?
      system "cargo", "install", *std_cargo_args
    else
      bin.install "morrow"
    end
  end

  test do
    assert_match "morrow", shell_output("#{bin}/morrow --help")
  end
end
