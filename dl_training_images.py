#download training images from gdrive
import sys
import gdown

# multi
id = sys.argv[1] #"1EF7jlMOzyxOlPHy8sXycVMC2cBel-sV7"
# print("downloading folder ...", id)
# save to training folder sys.argv[2] ==  "training_images"
fnames = gdown.download_folder(id=id, quiet=False, output=sys.argv[2], use_cookies=False)
# print(fnames)