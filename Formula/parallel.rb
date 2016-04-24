class Parallel < Formula
  desc "GNU parallel shell command"
  homepage "https://savannah.gnu.org/projects/parallel/"
  url "http://ftpmirror.gnu.org/parallel/parallel-20160422.tar.bz2"
  mirror "https://ftp.gnu.org/gnu/parallel/parallel-20160422.tar.bz2"
  sha256 "065a8f471266361218a9eb45c5f8ab995d73b181cc1180600ee08cc768c9ac42"
  head "http://git.savannah.gnu.org/r/parallel.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "51e1a467405d72c2c76526c44494ed94be5de6b7009d19d4c0f850aa0bdcd7b0" => :el_capitan
    sha256 "bd833fefdb17c86a61562302b47973c79fe3b38041d3324d05bc51701ce3f42a" => :yosemite
    sha256 "82d442086841894e6c4df795590d7f61bc96ea69ec71fae7bde5279f1ef52533" => :mavericks
  end

  conflicts_with "moreutils", :because => "both install a 'parallel' executable."

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_equal "test\ntest\n",
                 shell_output("#{bin}/parallel --will-cite echo ::: test test")
  end
end
