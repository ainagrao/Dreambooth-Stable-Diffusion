# cd /workspace
# # Notes: do everything in workspace

# # OLD - git clone https://github.com/JoePenna/Dreambooth-Stable-Diffusion 
# git clone https://github.com/ainagrao/Dreambooth-Stable-Diffusion.git
# cd Dreambooth-Stable-Diffusion; 
# git checkout devel


cd /workspace
wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh

chmod +x Miniconda3-py38_4.12.0-Linux-x86_64.sh
./Miniconda3-py38_4.12.0-Linux-x86_64.sh -b -u
source ~/miniconda3/bin/activate

# TODO -b -p $HOME/miniconda3


# Notes: silent install with -b -p $HOME/miniconda3 did not work. i.e, conda not found after logout and login

# * Logout and login again

# Notes: use branch devel for bleeding edge changes

cd Dreambooth-Stable-Diffusion
conda env create -f environment.yaml
# Notes: This takes time. TODO - how to move this to docker. How much time does it take?

conda activate ldm

python dl_model.py $1
# Notes: download model.ckpt (from own google drive) using gdown

git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git

mkdir -p regularization_images/person_ddim
# Notes: dataset="person_ddim" #@param ["man_euler", "man_unsplash", "person_ddim", "woman_ddim", "blonde_woman"]

mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/*.* regularization_images/person_ddim

git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-woman_ddim.git


mkdir -p regularization_images/woman_ddim
mv -v Stable-Diffusion-Regularization-Images-woman_ddim/woman_ddim/*.* regularization_images/woman_ddim

git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-man_euler.git
mkdir -p regularization_images/man_euler
mv -v Stable-Diffusion-Regularization-Images-man_euler/man_euler/*.* regularization_images/man_euler

git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-man_unsplash.git
mkdir -p regularization_images/man_unsplash
mv -v Stable-Diffusion-Regularization-Images-man_unsplash/man_unsplash/*.* regularization_images/man_unsplash

mkdir training_images

#TODO: move all commands above to a shell script