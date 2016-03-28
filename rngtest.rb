require 'formula'

class Rngtest < Formula
  homepage 'https://github.com/oderwat/rngtest'
  head 'https://github.com/oderwat/rngtest.git'
  url 'https://github.com/oderwat/rngtest/archive/1.0.zip'
  sha256 'f5b029e4fb6dc52d3dd25d6c294194f5875e34cbb04374d5df8d8bee33b49f16'

  depends_on "argp-standalone" => :build

  def install
    inreplace 'Makefile', "/usr/local", HOMEBREW_PREFIX

    system "make librngd"
    system "make rngtest"
    bin.install "rngtest"

  end

  test do
    system "#{bin}/rngtest", "--version"
  end
end
