#download model.cpkt from gdrive
import sys
import gdown

url = "https://drive.google.com/u/1/uc?id=" + sys.argv[1] + "&export=download"
print("downloading...", url)
output = "model.cpkt"
gdown.download(url, output)