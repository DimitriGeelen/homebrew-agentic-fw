class Fw < Formula
  desc "Governance framework for AI coding agents — task traceability, structural gates, audit trails"
  homepage "https://github.com/DimitriGeelen/agentic-engineering-framework"
  url "https://github.com/DimitriGeelen/agentic-engineering-framework/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "cc919150c44629b03ce1168cb0937a6d9cb3484ab9c3b8139e06bbad33d7fe6c"
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
      fw is ready! Initialize a project:

        cd your-project && git init && fw init

      Then choose your path:

        1. Think first — explore before building:
           fw inception start "Define goals and architecture"

        2. Build now — fire off tasks immediately:
           fw work-on "Set up project" --type build

        3. Existing project — register your codebase:
           fw fabric register src/main.ts && fw fabric drift

        4. Dashboard — see your project at a glance:
           fw serve

      Documentation: https://github.com/DimitriGeelen/agentic-engineering-framework
    EOS
  end

  test do
    assert_match "Agentic Engineering Framework", shell_output("#{bin}/fw version")
  end
end
