# Package inventory

Creates package inventory file that lists all the systems packages

## Setup

Clone the repository or download the zip and unpack it.
Then `cd` into the `package-inventory` folder.

### Create configuration file

#### Ubuntu (optional - defaults should work)
```
mkdir -p $HOME/.config/package-inventory
cp config/ubuntu.sh $HOME/.config/package-inventory/config.sh
```

#### Manjaro
```
mkdir -p $HOME/.config/package-inventory
cp config/manjaro.sh $HOME/.config/package-inventory/config.sh
```

## Usage
```
sh package-inventory.sh
```
