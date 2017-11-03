This configuration intentionally doesn't contain any spell files

The vimrc entry contains a number of plugins (as packages)
    - After cloning run the following commands inside the .vim directory
        mkdir -p pack/minpac/opt
        cd pack/minpac/opt
        git clone https://github.com/k-takata/minpac.git
    - Then start vim and inside run the command :PackUpdate
    - To controll the installation the command :messages can be used
Now vim should be set up properly
