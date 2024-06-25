# Panda - Open Source Crypto Wallet

## 🚀 Getting Onboard

1. Install [node.js LTS version](https://nodejs.org/en/)
2. Install [yarn package management tool](https://yarnpkg.com/)
3. Install [git lfs](https://git-lfs.github.com/) (some binaries are required for pulling and updating)
4. To start the iOS project, make sure that the local XCode version is greater than or equal to 13.3
5. To start the Android project, make sure that the local JDK version is greater than or equal to 11

After pulling the latest code via the git command line tool, install the project dependencies in the root directory via the `yarn` command

```
yarn
```

## 🧑‍💻 Develop

Execute the following commands in the root directory to develop different business code

- `yarn app:web`: Develop web mode, which starts a static server on port 3000 locally
- `yarn app:ios`: connect to iphone device via USB for development debugging
- `yarn app:android`: develop android
- `yarn app:desktop`: development in desktop mode
- `yarn app:web`: development in extension mode
