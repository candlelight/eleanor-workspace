# GitHub SSH Setup Guide

This guide sets up SSH key authentication for the `eleanor-workspace` repository, so you can push without entering tokens every time.

---

## Step 1: Generate SSH Key

Run this in your terminal:

```bash
ssh-keygen -t ed25519 -C "efox@agentmail.to" -f ~/.ssh/eleanor_github
```

When prompted for a passphrase:
- **Option A:** Press Enter for no passphrase (easier, less secure)
- **Option B:** Enter a passphrase (more secure, requires entering it each time)

---

## Step 2: Add SSH Key to GitHub

1. Copy the public key:
   ```bash
   cat ~/.ssh/eleanor_github.pub
   ```

2. Go to https://github.com/settings/keys

3. Click **"New SSH key"**

4. Fill in:
   - **Title:** `Eleanor Workspace`
   - **Key type:** Authentication Key
   - **Key:** Paste the output from step 1

5. Click **"Add SSH key"**

---

## Step 3: Configure SSH to Use the Key

Create/edit `~/.ssh/config`:

```bash
nano ~/.ssh/config
```

Add this section:

```
Host github-eleanor
    HostName github.com
    User git
    IdentityFile ~/.ssh/eleanor_github
    IdentitiesOnly yes
```

Save (Ctrl+O, Enter, Ctrl+X).

---

## Step 4: Update Git Remote to Use SSH

In the workspace directory:

```bash
cd /root/.openclaw/workspace
git remote set-url origin git@github-eleanor:candlelight/eleanor-workspace.git
```

---

## Step 5: Test the Connection

```bash
ssh -T git@github-eleanor
```

You should see:
```
Hi candlelight! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Step 6: Test a Push

```bash
cd /root/.openclaw/workspace
git push origin main
```

If it works without asking for a password, you're done!

---

## For Eleanor (Automated Pushes)

Once SSH is set up, the auto-backup script will work without tokens. The script at `scripts/auto_backup.sh` will push using the SSH key.

**Note:** If you used a passphrase in Step 1, automated pushes won't work without an SSH agent. For full automation, use no passphrase or set up `ssh-agent`.

---

## Troubleshooting

**"Permission denied" error:**
- Check the SSH key is added to GitHub: https://github.com/settings/keys
- Verify the key file permissions: `chmod 600 ~/.ssh/eleanor_github`
- Test connection: `ssh -vT git@github-eleanor`

**"Could not resolve hostname" error:**
- Make sure `~/.ssh/config` exists and has the Host entry
- Check for typos in the config file

**Push still asks for password:**
- Run: `git remote -v` — should show `git@github-eleanor:` not `https://`
- If it shows `https://`, re-run Step 4

---

## Security Notes

- The private key (`~/.ssh/eleanor_github`) should never be shared
- If the machine is compromised, revoke the key at https://github.com/settings/keys
- Consider using a passphrase if others have access to this machine

---

*Last updated: March 12, 2026*
