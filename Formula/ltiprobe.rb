class Ltiprobe < Formula
  include Language::Python::Virtualenv

  desc "HTTP/DNS/ICMP/TCP/TLS latency measurement tool with SLO validation, Path MTU, traceroute detail, HDR histogram merge and CDN detection"
  homepage "https://github.com/bglatence/ltiprobe"
  url "https://files.pythonhosted.org/packages/e9/70/ddff7538428da76451cd96fdc7e24e9db00ebf95b89c361592fd782e161a/ltiprobe-1.5.5.tar.gz"
  sha256 "955ae313ce2d0d31ddea8635d1721f5f3afc3abde3ee6b471046d3b4a176c561"
  license "MIT"

  depends_on "python@3.12"

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/09/a9/6ba95a270c6f1fbcd8dac228323f2777d886cb206987444e4bce66338dd4/tqdm-4.67.3.tar.gz"
    sha256 "7d825f03f89244ef73f1d4ce193cb1774a8179fd96f31d7e1dcde62092b960bb"
  end

  resource "hdrhistogram" do
    url "https://files.pythonhosted.org/packages/c2/79/674aad5279dd1a77b85efa1cbf8dcead209dc5f38f55cbbfd75bc20cc65b/hdrhistogram-0.10.3.tar.gz"
    sha256 "f3890df0a6f3c582a0a8b2a49a568729cb319f1600683e4458cc98b68ca32841"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/source/d/dnspython/dnspython-2.8.0.tar.gz"
    sha256 "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "ltiprobe 1.5.5", shell_output("#{bin}/ltiprobe --version")
  end
end
