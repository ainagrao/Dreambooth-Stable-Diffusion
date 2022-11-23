# Training

# This isn't used for training, just to help you remember what your trained into the model.
project_name=$1 #picsofnr

# MAX STEPS
# How many steps do you want to train for?
max_training_steps=2000

# Match class_word to the category of the regularization images you chose above.
class_word=$2 # typical uses are "person", "woman". others to be supported

# This is the unique token you are incorporating into the stable diffusion model.
token=$3 # "firstNameLastName"

# This is relevant to class_word e.g person_ddim
dataset="${class_word}_ddim"
reg_data_root="/workspace/Dreambooth-Stable-Diffusion/regularization_images/${dataset}"

training_images_folder="training_images/"
rm -rf ${training_images_folder}.ipynb_checkpoints
rm -f ${training_images_folder}*

# Download training images from gdrive url
python dl_training_images $4 ${training_images_folder}/

python main.py \
 --base configs/stable-diffusion/v1-finetune_unfrozen.yaml \
 -t \
 --actual_resume "model.ckpt" \
 --reg_data_root "${reg_data_root}" \
 -n "${project_name}" \
 --gpus 0, \
 --data_root "/workspace/Dreambooth-Stable-Diffusion/${training_images_folder}" \
 --max_training_steps ${max_training_steps} \
 --class_word "${class_word}" \
 --token "${token}" \
 --no-test

