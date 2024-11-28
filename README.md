# crave-in-termux

These are the scripts that allows you to install Ubuntu in your termux application without a rooted device and ultimately [crave](https://github.com/accupara/crave) as well.

## What's Crave

Better Checkout this: [crave.io](https://crave.io)

## Updates

**• Updated ubuntu to 24.10**

**• Updated crave cli tool to version 0.2-7049**

## Important

**• If you have to use ubuntu in termux with a x86/i\*86 architecture or prefer ubuntu 19.10 you can use this branch -> https://github.com/MFDGaming/ubuntu-in-termux/tree/ubuntu19.10**

**• If you get an error message that says "Fatal Kernel too old" you have to uncomment the line that reads "command+=" -k 4.14.81"" (remove the # that is located in front of the line) in the "startubuntu.sh" file**

### Easy Installation (Crave in Termux)

1. Allow termux to create storage folder

   ```termux-setup-storage```

2. Make sure that your crave.conf.txt file saved under Download folder in file manager.

3. Install crave in termux

   ```curl -LSs "https://raw.githubusercontent.com/GhostMaster69-dev/crave-in-termux/refs/heads/master/crave-in-termux.sh" | bash```

4. Start crave devspace in termux

   ```./startubuntu.sh "crave devspace"```

