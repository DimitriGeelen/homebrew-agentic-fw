class Fw < Formula
  desc "Governance framework for AI coding agents — task traceability, structural gates, audit trails"
  homepage "https://github.com/DimitriGeelen/agentic-engineering-framework"
  url "https://github.com/DimitriGeelen/agentic-engineering-framework/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "cd38d273bf2b1641b1f206f2abaa8ebcb86658c0b62258e86b7345edd8b46ad9"
  license "Apache-2.0"
  head "https://github.com/DimitriGeelen/agentic-engineering-framework.git", branch: "master"

  depends_on "bash"
  depends_on "git"
  depends_on "python@3.11" => :optional

  def install
    # Install framework files
    libexec.install Dir["*"]
    libexec.install Dir[".*"].reject { |f| f.end_with?(".", "..") }

    # Create fw wrapper that points to the installed framework
    (bin/"fw").write <<~EOS
      #!/bin/bash
      export FRAMEWORK_ROOT="#{libexec}"
      exec "#{libexec}/bin/fw" "$@"
    EOS
  end

  def caveats
    <<~EOS
      fw is ready! Navigate to any project directory and run a command —
      if no project is detected, fw will offer to initialize automatically.

      Or initialize manually:
        cd your-project
        fw init

      Documentation: https://github.com/DimitriGeelen/agentic-engineering-framework
    EOS
  end

  test do
    assert_match "Agentic Engineering Framework", shell_output("#{bin}/fw version")
  end
end
