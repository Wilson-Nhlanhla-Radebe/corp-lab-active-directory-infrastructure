# Publish this project to GitHub using SSH

The target repository is:

`git@github.com:Wilson-Nhlanhla-Radebe/corp-lab-active-directory-infrastructure.git`

## Linux Mint / Ubuntu instructions

1. Download and extract `corp-lab-active-directory-infrastructure.zip`.
2. Open Terminal in the extracted `corp-lab-active-directory-infrastructure` folder.
3. Run:

   ```bash
   ./publish-to-github.sh
   ```

The script tests SSH access with `git ls-remote`, initializes a local `main` branch if needed, stages the prepared files, creates a commit, and pushes to the target `main` branch. It refuses to initialize over a non-empty remote or use a different configured origin. It does not copy private keys or tokens.

If it reports an SSH error, run `ssh -T git@github.com` locally and confirm the correct public SSH key is attached to your GitHub account. If Git reports that a key is not accepted, resolve that on your computer; never paste the private key into chat.

## After publishing

Open the repository in a browser and verify the README renders, the screenshots display, and the workflow files are present. The repository will be public, as requested. The attached source report includes a known RDP issue and incomplete file-access testing; both are deliberately documented rather than concealed.
