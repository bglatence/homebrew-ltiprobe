class Ltiprobe < Formula
  include Language::Python::Virtualenv

  desc "HTTP/DNS/ICMP/TCP/TLS latency measurement tool with SLO validation and CDN detection"
  homepage "https://github.com/bglatence/ltiprobe"
  url "https://files.pythonhosted.org/packages/source/l/ltiprobe/ltiprobe-0.8.0.tar.gz"
  sha256 "ccdad54ca66ad65d8aefa8b10552f58fbfbca7a17eaf3793a2e3b0c9ef6e0d43"
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

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "ltiprobe 0.8.0", shell_output("#{bin}/ltiprobe --version")
  end
end
