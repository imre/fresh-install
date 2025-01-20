#  Fresh Install on a new Mac


## Firefox
[Download Browser](https://www.mozilla.org/en-GB/firefox/new/)

### Density: Compact  
[Walkthrough Guide](https://support.mozilla.org/en-US/kb/compact-mode-workaround-firefox)

### Bookmarks open in new tab
[Walkthrough Guide](https://support.mozilla.org/en-US/questions/1207970)


### Extensions:
  - uBlock Origin
  - I don't care about cookies
  - Panorama Tab Group
  - Momentum



## HomeBrew:
Install brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install apps
```
brew install \
   htop \
   kitty \
   jetbrains-toolbox \
   postman \
   spotify \
   rectangle \
   sublime-text \
   vlc \ 
   slack \
```
## XCode
[Download Link](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

## System Preferences:
### Keyboard:
Modifier Keys: 🌐 (fn) Key ➡ ^ Control Key

Text Input: 🇬🇧 British - PC

## Sublime Text 4:
Theme:

- Press: ⌘ + ⬆️ + 🅿️: Install Package
- ayu
- Color Scheme: ayu-dark
- Color Theme: ayu-mirage

## Set Up GitHub profile to your machine

```
git config --global user.name "notimre"
```

```
git config user.email "your_email@abc.example"
```

## Generate SSH Key:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
Copy the contents of the id_rsa.pub file to your clipboard
```
pbcopy < ~/.ssh/id_rsa.pub
```  

<!--Courtesy of: https://gist.github.com/Beneboe/3183a8a9eb53439dbee07c90b344c77e -->
How to Setup Verified Commits
=============================

Quick guide on how to setup git signing. Information is aggregated from
following sources:

* <https://help.github.com/articles/signing-commits/>
* <https://help.github.com/articles/telling-git-about-your-signing-key/>
* <https://help.github.com/articles/generating-a-new-gpg-key/>
* <https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/>

Creating GPG Keys
-----------------

1. First, generate a GPG key pair. Your GPG key must use RSA with a key size of
   4096 bits.

```
$ gpg --full-generate-key
```

2. At the prompt, specify the kind of key you want, or press Enter to accept the
   default RSA and RSA.
3. Enter the desired key size. We recommend the maximum key size of `4096`.
4. Enter the length of time the key should be valid. Press Enter to specify the
   default selection, indicating that the key doesn't expire.
5. Verify that your selections are correct.
6. Enter your user ID information.

> When asked to enter your email address, ensure that you enter the verified
> email address for your GitHub account. To keep your email address private,
> use your GitHub-provided no-reply email address. For more information, see
> "Verifying your email address" and "About commit email addresses."


7. Type a secure passphrase.
8. Use the `gpg --list-secret-keys --keyid-format LONG` command to list GPG keys
   for which you have both a public and private key. A private key is required
   for signing commits or tags. From the list of GPG keys, copy the GPG key ID
   you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

```
$ gpg --list-secret-keys --keyid-format LONG
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

9. Paste the text below, substituting in the GPG key ID you'd like to use. In
   this example, the GPG key ID is `3AA5C34371567BD2`:

```
$ gpg --armor --export 3AA5C34371567BD2
# Prints the GPG key ID, in ASCII armor format
```

10. Copy your GPG key, beginning with `-----BEGIN PGP PUBLIC KEY BLOCK-----`
    and ending with `-----END PGP PUBLIC KEY BLOCK-----`.

Adding a new GPG key to your GitHub account
-------------------------------------------

1. In the upper-right corner of any page, click your profile photo, then click
   Settings.
2. In the user settings sidebar, click SSH and GPG keys.
3. Click New GPG key.
4. In the "Key" field, paste the GPG key you copied when you generated your GPG
   key.
5. Click Add GPG key.
6. To confirm the action, enter your GitHub password.

Getting GPG Keys
----------------

1. Open Git Bash
2. Use the `gpg --list-secret-keys --keyid-format LONG` command to list GPG keys for which you have both a public and private key. A private key is required for signing commits or tags.
3. From the list of GPG keys, copy the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

```
$ gpg --list-secret-keys --keyid-format LONG
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

Git Settings
------------

To set your GPG signing key in Git, paste the text below, substituting in the
GPG key ID you'd like to use. In this example, the GPG key ID is
`3AA5C34371567BD2`:

```
$ git config --global user.signingkey 3AA5C34371567BD2
```

To tell git to automatically sign commits you can set:

```
$ git config --global commit.gpgsign true
```

<!-- End of Reference-->

## Tips

### Declare Standard Encryption for App Store Connect

Add this to `Info.plist`
```
    <key>ITSAppUsesNonExemptEncryption</key>
    <false/>
```

### If Kitty's font on oh-my-zsh isn't working properly, try installing `Powerline Fonts` manually:

- 1. Clone the repository
	```
	git clone git@github.com:powerline/fonts.git
	```
	```
	cd fonts/
	```
- 2. Install the fonts
	```
	./install.sh
	```
- 3. Refresh the font cache, saves logging
	```
	sudo fc-cache -fv
	```
- 4. Restart Kitty


## Check if private & public keys match

- 1. Private key SHA
	```
	ssh-keygen -l -f /path/to/private/key
	```
- 2. Public key SHA
	```
	ssh-keygen -l -f /path/to/public/key
	```
- 3. If it's the same, it works!

## Install Flutter 🤮

### Step-by-step installation so you don't mess up next time...

- 1. Go to flutter website, donwload the zip file
	```
	https://docs.flutter.dev/get-started/install/macos
	```
- 2. Unzip it in ~/Documents/dev to resovle to `/flutter`

- 3. Add to path, replacing `pwd` with your path
	```
	export PATH="$PATH:`pwd`/flutter/bin"
	```
- 4. Run the following command to fix any issues
	```
	flutter doctor
	```

## Deploying a brand new project on azure

1. Create a terraform .env file

```
export TF_VAR_subscription_id=""
export TF_VAR_resource_group_name=""
export TF_VAR_resource_group_location=""
export TF_VAR_project_name=""
export TF_VAR_project_pi=""
export TF_VAR_project_contributors=""
export TF_VAR_image_name=""
export TF_VAR_host=""
export TF_VAR_port=""
export TF_VAR_app_keys=""
export TF_VAR_admin_jwt_secret=""
export TF_VAR_api_token_salt=""
export TF_VAR_database_username=""
export TF_VAR_database_password=""
export TF_VAR_sentry_dsn=""
```

2.

```
$ export .env
```
```
$ source .env
```
echo one of the values to make sure source worked

3. `terrafrom init` --> should run correctly

4. Log in to azure
```
$ az login
```
5. ```terraform apply```


## Delete file from git history in repo

### Make a backup of your repo first!!!!!!!!!!!!!!!!

1. Download https://rtyley.github.io/bfg-repo-cleaner/

2. Run `git clone --mirror git@github://your.repo/`

3. Run `bfg --delete-files filename reponame.git`

4. Run `cd reponame` NOT THE .GIT ONE!

5. Run `git reflog expire --expire=now --all && git gc --prune=now --aggressive`

6. DONE

### Have everyone delete the repo and clone the new one


