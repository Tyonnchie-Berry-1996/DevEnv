<!DOCTYPE html>
<html lang="en">
<body>
  <header>
    <h1>Dev-Env</h1>
    <p class="tagline">
      Lightweight Fedora-based dev environment for Linux kernel, automation, and systems engineering that bootstraps your toolchain on first run. The toolchain          includes libraries and utilities needed to build Linux kernels, plus solid support for Python-heavy development. It has enough tooling to build kernels and        test out some of my repositories—or your own projects. If you bring your own code, just follow the steps below; while your specific           Python packages may not be preinstalled, the environment is designed so you can simply run pip3 install &lt;your-python-package&gt; and be up and running          quickly.
    </p>
    <p>
      Docker Hub:
      <a href="https://hub.docker.com/r/tyonnchieberry/dev-env" target="_blank" rel="noopener">
        hub.docker.com/r/tyonnchieberry/dev-env
      </a>
    </p>
  </header>

  <main>
    <section>
      <h2>Overview</h2>
      <p>
        <code>Dev-Env</code> is a <strong>lightweight Fedora-based developer environment</strong>
        tailored for:
      </p>
      <ul>
        <li>Linux kernel builds</li>
        <li>Python Development</li>
        <li>General CLI and homelab tooling</li>
      </ul>
      <p>
        Instead of shipping a huge image with everything pre-installed, this container starts small and
        <strong>bootstraps the full toolchain on first run</strong> via setup bash scripting & ansible playbook.
        This keeps pulls fast while still giving you a reproducible environment.
      </p>
  

        </section>

    <section>
      <h2>Prerequisites</h2>
      <ul>
        <li>
          <strong>Docker</strong> installed and running on your system
          (Linux, macOS, or Windows with WSL2 / Docker Desktop).
        </li>
        <li>
          A terminal or shell you’re comfortable using (e.g., <code>bash</code>, <code>zsh</code>, PowerShell).
        </li>
        <li>
          Optional but recommended: a directory on your host machine for
          <strong>persistent work</strong> (code, configs, etc.).
        </li>
      </ul>
    </section>

    <section>
      <h2>Quick Start</h2>

      <h3>1. Pull the Image</h3>
      <p>Download the latest version of the dev environment:</p>
      <pre><code>docker pull tyonnchieberry/dev-env</code></pre>

      <h3>2. Run the Container (First Time)</h3>
      <p>
        Start an interactive shell inside the container. On first run, the image will bootstrap your dev tools:
      </p>
      <pre><code>docker run --rm -it tyonnchieberry/dev-env bash</code></pre>

      <div class="callout">
        <strong>What happens on first run?</strong><br />
        The container executes bootstrap logic that installs and configures the core toolchain
        (compilers, build tools, Python tooling, etc.). This may take a bit longer the first time
        while packages are being installed.
      </div>

      <h3>3. Run with a Persistent Volume (Recommended)</h3>
      <p>
        To keep your code and configuration between runs, mount a host directory into the container:
      </p>
      <pre><code># Replace /path/on/host with an actual directory (e.g., $HOME/dev-env)
docker run --rm -it \
  -v /path/on/host:/workspace \
  tyonnchieberry/dev-env bash

# Inside the container, do your work in:
cd /workspace
</code></pre>
      <p>
        This way, you can safely destroy containers while your source files and configs remain on the host.
      </p>
    </section>

    <section>
      <h2>What This Environment Is Good For</h2>
      <ul>
        <li>Experimenting with Linux kernel and systems-level tooling in a clean sandbox.</li>
        <li>Developing Python automation around APIs like Bugzilla, Confluence, Errata, Jira, etc.</li>
        <li>Prototyping release engineering, RPM packaging, and CI-related scripts.</li>
        <li>Using a consistent dev environment across multiple machines or homelab nodes.</li>
      </ul>
    </section>

    <section>
      <h2>Example Workflows</h2>

      <h3>Kernel / Systems Work</h3>
      <ol>
        <li>Start the container with a mounted workspace directory.</li>
        <li>Clone your repo inside <code>/workspace</code>.</li>
        <li>Use the installed toolchain to build, test, or patch.</li>
      </ol>
      <pre><code>docker run --rm -it -v $HOME/dev-env:/workspace tyonnchieberry/dev-env bash
cd /workspace
git clone &lt;your-kernel-or-tools-repo&gt;
cd &lt;repo&gt;
# build / test here</code></pre>

      <h3>Python Automation / API Scripting</h3>
      <ol>
        <li>Run the container and mount your scripts directory.</li>
        <li>Install any extra Python packages you need (if not already in the bootstrap set).</li>
        <li>Run your automation scripts from inside the container.</li>
      </ol>
      <pre><code>docker run --rm -it -v $HOME/automation:/workspace tyonnchieberry/dev-env bash
cd /workspace
python your_script.py</code></pre>
    </section>

    <section>
      <h2>Tips & Best Practices</h2>
      <ul>
        <li>Use a dedicated host directory (like <code>$HOME/dev-env</code>) for long-term projects.</li>
        <li>Keep your scripts and configuration files in the mounted directory, not the container root filesystem.</li>
        <li>If you update the image, re-pull with <code>docker pull tyonnchieberry/dev-env</code> to get the latest bootstrap logic.</li>
        <li>Use tags if/when they are added (e.g., <code>:latest</code>, <code>:v1</code>) to pin a specific environment version.</li>
      </ul>
    </section>

    <section>
      <h2>Links</h2>
      <ul>
        <li>
          Docker Hub:
          <a href="https://hub.docker.com/r/tyonnchieberry/dev-env" target="_blank" rel="noopener">
            https://hub.docker.com/r/tyonnchieberry/dev-env
          </a>
        </li>
        <li>
          GitHub (projects, code, and automation work):
          <a href="https://github.com/Tyonnchie-Berry-1996" target="_blank" rel="noopener">
            https://github.com/Tyonnchie-Berry-1996
          </a>
        </li>
      </ul>
    </section>
  </main>
</body>
</html>
