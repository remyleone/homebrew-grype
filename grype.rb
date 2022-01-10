# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Grype < Formula
  desc "A vulnerability scanner for container images and filesystems"
  homepage "https://github.com/anchore/grype"
  version "0.30.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/anchore/grype/releases/download/v0.30.0/grype_0.30.0_darwin_amd64.zip"
      sha256 "46fffa8cd9494a984ec77e425b6a8c17407a74282fb39d15a46b953a23688945"
    end
    if Hardware::CPU.arm?
      url "https://github.com/anchore/grype/releases/download/v0.30.0/grype_0.30.0_darwin_arm64.zip"
      sha256 "0f9d349b56cbc7b9e2232504869b2d4cf5e662fe8b38be646f041b1bd118e812"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/anchore/grype/releases/download/v0.30.0/grype_0.30.0_linux_amd64.tar.gz"
      sha256 "0a161ebf99f5ec95f3b166570a450821fd477ac4d5a14695be7e345d49ddeb46"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/anchore/grype/releases/download/v0.30.0/grype_0.30.0_linux_arm64.tar.gz"
      sha256 "5ab68f3807ab797d20f4930ea5f16340edba4edfc3d7563d8440389ef4d4378e"
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
