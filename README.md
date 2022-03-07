# main
Main part of UFlinux - debian live build folder

You can download iso here - https://uflinux.eu/

![uflinuxdesktop](https://user-images.githubusercontent.com/35844848/147685144-46d9e5c3-e400-48f6-8e8b-460350cbed56.png)

## Build
if you want to build ISO from this you need to install debian live build

```bash
apt-get install live-build
```

and then execute this command in directory main (this repo)

```bash
chmod +x auto/* && sudo lb config && sudo lb build
```
This will build ISO which will propably be slightly different than from official site because it will contain latest updates. If you want to make image again (for example with some changes) you must run

```bash
sudo lb clean && sudo lb build
```

Make sure that everything in foler auto is executable
