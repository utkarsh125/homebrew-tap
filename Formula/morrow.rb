class Morrow < Formula
  desc "Calm, keyboard-first terminal workspace for chatting with local LLMs via Ollama"
  homepage "https://github.com/utkarsh125/morrow"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.1/morrow-aarch64-apple-darwin.tar.gz"
      sha256 "fc4001547fccd972751d4bb9575234cac5947b76c2f734e97d2b8b586976f4fe"
    else
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.1/morrow-x86_64-apple-darwin.tar.gz"
      sha256 "3ca06b08e6707cdbfb29a11d4d47773caeea5240826c1589c61622d4aaefff48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.1/morrow-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d720830d6b271d11c90af8acbfe1ee3ff9c390b8cbd18e0edc22d6721f04da6"
    else
      url "https://github.com/utkarsh125/morrow/releases/download/v0.1.1/morrow-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2075024b549dd19c8f5621a1bb4a06347279a481ba0a9cca82f386b38051c3fc"
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
