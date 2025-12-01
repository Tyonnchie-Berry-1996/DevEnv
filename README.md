<!DOCTYPE html>
<html lang="en">
<body>
  <header>
    <h1>Dev-Env</h1>
    <p class="tagline">
      Lightweight Fedora-based dev environment for Linux kernel, automation, and systems engineering that bootstraps your tool-chain on first run. The toolchain          includes libraries and utilities needed to build Linux kernels, plus solid support for Python-heavy development. It has enough tooling to build kernels and        test out some of my repositories—or your own projects. If you bring your own code, just follow the steps below; while your specific Python packages may not be preinstalled, the environment is designed so you can simply run pip3 install &lt;your-python-package&gt; and be up and running quickly.
    </p>
    <p>
      Docker Hub:
      <a href="https://hub.docker.com/r/tyonnchieberry/dev-env" target="_blank" rel="noopener">
        hub.docker.com/r/tyonnchieberry/dev-env
      </a>
    </p>
  </header>

  <main>
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
  <strong>Prerequisites</strong>

- Docker installed and running (Linux, macOS, or Windows with Docker Desktop).

## Quick Start

1. **Pull the image**

   ```bash
   docker pull tyonnchieberry/dev-env
   ```
2. **Run It**
   ```bash
   docker run -it tyonnchieberry/dev-env:latest
   ```
3. **Test some automation and paste these steps into the container**
   ```bash
   git clone https://github.com/Tyonnchie-Berry-1996/Container-Repo-Automation.git
   ```
   ```bash
   mv Container-Repo-Automation/repo-setup.sh $(pwd)
   chmod +x repo-setup.sh
   ./repo-setup.sh
   ```       
    <h2>Try out the AI Bash Assistant</h2>
    <p>
      Important note: Kerberos for this container syncs with FEDORAPROJECT.ORG. If you use fedora/have a fedora account setup
      for the command below use your fedora username and password to init kerberos.

      Inside the container run this command below with your fedora username and when prompted use your fedora password
    </p>
    
    ```bash
    kinit {your_fedora_username}
    ```
  </main>
</body>
</html>
