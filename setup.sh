* cd /workspace
Notes: do everything in workspace

OLD - git clone https://github.com/JoePenna/Dreambooth-Stable-Diffusion 
* git clone https://github.com/ainagrao/Dreambooth-Stable-Diffusion.git

* wget https://repo.anaconda.com/miniconda/Miniconda3-py38_4.12.0-Linux-x86_64.sh

* chmod +x Mini...
* ./Miniconda3-py38_4.12.0-Linux-x86_64.sh


Notes: silent install with -b -p $HOME/miniconda3 did not work. i.e, conda not found after logout and login

* Logout and login again
* cd /workspace

* cd Dream....; git checkout devel
Notes: use branch devel for bleeding edge changes

*conda env create -f environment.yaml
Notes: This takes time. TODO - how to move this to docker. How much time does it take?

*conda activate ldm

* python dl_model.py 1oRe51EA8h2OfzhI-0CkOoYVs_-ImZ0pR
Notes: download model.ckpt (from own google drive) using gdown
https://drive.google.com/file/d/1oRe51EA8h2OfzhI-0CkOoYVs_-ImZ0pR/view?usp=sharing

* cd ..

* git clone https://github.com/djbielejeski/Stable-Diffusion-Regularization-Images-person_ddim.git

* mkdir -p regularization_images/person_ddim

Notes: dataset="person_ddim" #@param ["man_euler", "man_unsplash", "person_ddim", "woman_ddim", "blonde_woman"]

* mv -v Stable-Diffusion-Regularization-Images-person_ddim/person_ddim/*.* regularization_images/person_ddim

TODO: move all commands above to a shell script