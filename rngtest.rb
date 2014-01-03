require 'formula'

class Rngtest < Formula
  homepage 'https://github.com/oderwat/rngtest'
  head 'https://github.com/oderwat/rngtest.git'
  url 'https://github.com/oderwat/rngtest/archive/1.0.zip'
  sha1 '581dca0bab9e1c2f72d1642d67c06eaeb80a4bbd'

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
