class Fw < Formula
  desc "Governance framework for AI coding agents — task traceability, structural gates, audit trails"
  homepage "https://github.com/DimitriGeelen/agentic-engineering-framework"
  url "https://github.com/DimitriGeelen/agentic-engineering-framework/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "9bead9521e040c9f2358748bb653754527d860a71a4a737ed3aab819681b1ddc"
  license "Apache-2.0"
  head "https://github.com/DimitriGeelen/agentic-engineering-framework.git", branch: "master"

  depends_on "bash"
  depends_on "git"
  depends_on "python@3.11" => :optional

  def install
    libexec.install Dir["*"]
    libexec.install Dir[".*"].reject { |f| f.end_with?(".", "..") }

    (bin/"fw").write <<~EOS
      #!/bin/bash
      export FRAMEWORK_ROOT="#{libexec}"
      exec "#{libexec}/bin/fw" "$@"
    EOS
  end

  def caveats
    <<~EOS
      fw is ready! Initialize a project:

        fw init                  # current directory
        fw init /path/to/project # specific directory

      Then choose your path:

        1. Think first — explore before building:
           fw inception start "Define goals and architecture"

        2. Build now — fire off tasks immediately:
           fw work-on "Set up project" --type build

        3. Existing project — map your files so the framework knows what depends on what:
           fw fabric register src/main.ts   # register key files
           fw fabric drift                   # find unregistered files

        4. Dashboard — live view of tasks, audit, and metrics:
           fw serve                          # http://localhost:3000
           fw serve --port 5000              # custom port

      Documentation: https://github.com/DimitriGeelen/agentic-engineering-framework
    EOS
  end

  test do
    assert_match "Agentic Engineering Framework", shell_output("#{bin}/fw version")
  end
end
