# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Grype < Formula
  desc "A vulnerability scanner for container images and filesystems"
  homepage "https://github.com/anchore/grype"
  version "0.19.0"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/anchore/grype/releases/download/v0.19.0/grype_0.19.0_darwin_amd64.zip"
    sha256 "6d7c55241ba84a6a8a50bec1e639adabde503217d62cd4ad1b5481255358de84"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/anchore/grype/releases/download/v0.19.0/grype_0.19.0_linux_amd64.tar.gz"
    sha256 "3012a33dd4573f34a1f6c6172eed094a8193c291c3fa2511a3c1d33cdc09da0f"
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
