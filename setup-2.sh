# call with cmd line param of gdrive model.ckpt
cd /workspace

cd Dreambooth-Stable-Diffusion; 
git checkout devel

# Notes: use branch devel for bleeding edge changes

conda env create -f environment.yaml
# Notes: This takes time. TODO - how to move this to docker. How much time does it take?

conda activate ldm

python dl_model.py $1
# Notes: download model.ckpt (from own google drive) using gdown

git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git

mkdir -p regularization_images/person_ddim
# Notes: dataset="person_ddim" #@param ["man_euler", "man_unsplash", "person_ddim", "woman_ddim", "blonde_woman"]

mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/*.* regularization_images/person_ddim

mkdir training_images

#TODO: move all commands above to a shell script