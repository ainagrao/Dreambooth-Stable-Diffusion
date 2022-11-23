# Generate image using the new model
model_name=$1
out_dir=$2
prompt_text=$3

# clean output directory
rm -f ${out_dir}


python scripts/stable_txt2img.py \
 --ddim_eta 0.0 \
 --n_samples 1 \
 --n_iter 4 \
 --scale 7.0 \
 --ddim_steps 50 \
 --ckpt "/workspace/Dreambooth-Stable-Diffusion/trained_models/${model_name}" \
 --outdir "/workspace/Dreambooth-Stable-Diffusion/${out_dir}" \
 --prompt "${prompt_text}"