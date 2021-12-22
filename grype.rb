# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Grype < Formula
  desc "A vulnerability scanner for container images and filesystems"
  homepage "https://github.com/anchore/grype"
  version "0.28.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/anchore/grype/releases/download/v0.28.0/grype_0.28.0_darwin_amd64.zip"
      sha256 "beadfe60b199f3bb22d7618629093f7c14dcea9b957887c42fc225dcfe02dc66"
    end
    if Hardware::CPU.arm?
      url "https://github.com/anchore/grype/releases/download/v0.28.0/grype_0.28.0_darwin_arm64.zip"
      sha256 "de30ff4bff721bf5e3c7d509174e1745b03e1157f8e2c63f4b79848cdf9a4ecc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/anchore/grype/releases/download/v0.28.0/grype_0.28.0_linux_amd64.tar.gz"
      sha256 "8310224d2ddac10fc344e5cb565586e71416e42f6e0461da37e9ff2c95a59e4a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/anchore/grype/releases/download/v0.28.0/grype_0.28.0_linux_arm64.tar.gz"
      sha256 "5f423868ec56dd6666ad64de03b324bbc3d5bacff7332c042a371201958d082d"
    end
  end

  def install
    bin.install "grype"

    # Install bash completion
    output = Utils.popen_read("#{bin}/grype completion bash")
    (bash_completion/"grype").write output

    # Install zsh completion
    output = Utils.popen_read("#{bin}/grype completion zsh")
    (zsh_completion/"_grype").write output
  end
end
