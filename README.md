<!DOCTYPE html>
<html lang="en">
<body>
  <header>
    <h1>Dev-Env</h1>
    <p class="tagline">
      Lightweight Fedora-based dev environment for Linux kernel, automation, and systems engineering that bootstraps your tool-chain on first run. The toolchain          includes libraries and utilities needed to build Linux kernels, plus solid support for Python-heavy development. It has enough tooling to build kernels and        test out some of my repositories—or your own projects. If you bring your own code, just follow the steps at the end; while your specific Python packages may not be preinstalled, the environment is designed so you can simply run pip3 install &lt;your-python-package&gt; and be up and running quickly.
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
        <strong>bootstraps the full tool-chain on first run</strong> via bash scripting/ansible playbook.
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
3. **Test out some repo automation**
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
    <strong>Important note:</strong> Kerberos is configured to authenticate against <strong>FEDORAPROJECT.ORG</strong> If you already have a fedora account setup,
    use your Fedora username and password when initializing Kerberos. Inside the container, run the command below with <strong>your Fedora username</strong>.  
    When prompted, enter <strong>your Fedora account password</strong> to complete Kerberos initialization.
  </p>
  <p>
    When running the AI assistant make sure you have your OpenAI API key ready to be copied and pasted into the container. You can find your API key here at            https://platform.openai.com/api-keys. You also will need tokens for this script to run, you can find out about your account tokens here at https://platform.openai.com/settings/organization/billing/overview. The script doesn't work unless it has an API key and account tokens available.   
  </p>
    
   ```bash
   kinit your_fedora_username
   ```
   ```bash
   cd AI-Bash-Assistant-Prototype/kernel/
   ```
   ```bash
   python3 ../AI-Bash-Assistant.py
   ```
***Use the questions below one at a time to prompt your AI assistant***
```bash
system update and system upgrade
Make a new bash file, name it bashfile.sh, and make sure that it prints my user name, date and time when executed
excute bashfile.sh
remove bashfile.sh
clear current terminal display
list all files in current dir
what distro am i running 
whats my ip addy 
I need a scratch build fedora f41
list kerberos 
destroy all active kerberos
tell me who i am 
```


<h2>Try out the API scripts</h2>
  <p> <strong>Important note:</strong> When running <code>Bug_Query.py</code> make sure you have your Bugzilla API key ready to be copied/pasted into the container.  
      You can find your API key here: https://bugzilla.redhat.com/userprefs.cgi?tab=apikey 
  </p>

  <p> <strong>Important note:</strong> When running <code>YouTube-API.py</code> make sure you have your Youtube API key and Youtube channel id ready to copied/pasted into the container. 
      Check later for steps on how to find your Youtube API key and Channel id.
  </p>
  
  <p>All python scripts in this folder are executable by prefixing them with <code>./</code>  </p>
    
**Try one out**
   ```bash
   cd /home/src/Scripts-For-Dev-Env
   ```
   ```bash
   ./Gmail-List.py
   ```
<h2>Bring Your Own Python (BYOP)</h2>
  <p>
  I’ve got a few different VMs with a lot of different Python versions on them, but my favorite is Python 3.9 If you use Python heavily, your machine eventually     turns into a Frankenstein of environments.

  But what if you want to take your favorite version + its packages and use them with a newer Python release?

  Normally, trying to "just upgrade” Python and reuse everything breaks half your stack, wipes out dependencies, and forces you to take a mental health break.       This project is my way of avoiding that: a cleaner path to carry forward the environment you like without wrecking your system. Run the commands below on your host machine. After the last step, you’ll see which installs succeeded and which failed. If a package fails, just let the Bash script finish— it will continue looping through the rest and write any failures to failed_packages.log so you can review them later. For the example below I'm assuming you have a src directory located at <code>/home/$USER/src</code>. If you don't please make one before following along <code> cd /home/$USER </code> <code> mkdir src </code>
  </p>

1. **Get package names (no versions)**
   ```bash
   python3.9 -m pip list --format=freeze | cut -d'=' -f1
   ```
2. **Save to file**
   ```bash
   cd /home/$USER/src
   python3.9 -m pip list --format=freeze | cut -d'=' -f1 > requirements-no-versions.txt
   ```
3. **Refactor, rebuild, reuse**
   ```bash
   git clone https://github.com/Tyonnchie-Berry-1996/DevEnv.git
   ```
   ```bash
   cd DevEnv/
   ```
   ```bash
   rm requirements.txt 
   ```
   ```bash
   mv ../requirements-no-versions.txt $(pwd)
   mv requirements-no-versions.txt requirements.txt
   ```
   ```bash
   docker build -t dev-env:latest .
   ```
   ```bash
   docker run -it dev-env:latest
   ```
   ***If you want to check and see which packages failed***
   ```bash
   cat /failed_packages.log
   ```

  </main>
</body>
</html>
