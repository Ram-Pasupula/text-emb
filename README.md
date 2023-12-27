curl 0.0.0.0:8080/embed \
    -X POST \
    -d '{"inputs":"What is Deep Learning?"}' \
    -H 'Content-Type: application/json'



 model=/tmp/te                  
(base) mac@C02XR00BLCM6 text-emb % ./text-embeddings-router --model-id $model  --port 8080

https://github.com/huggingface/text-embeddings-inference

CPU
You can also opt to install text-embeddings-inference locally.

First install Rust:

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
Then run:

# On x86
cargo install --path router -F candle -F mkl
# On M1 or M2
cargo install --path router -F candle -F accelerate
You can now launch Text Embeddings Inference on CPU with:

model=BAAI/bge-large-en-v1.5
revision=refs/pr/5

text-embeddings-router --model-id $model --revision $revision --port 8080
Note: on some machines, you may also need the OpenSSL libraries and gcc. On Linux machines, run:

sudo apt-get install libssl-dev gcc -y
Cuda
GPUs with Cuda compute capabilities < 7.5 are not supported (V100, Titan V, GTX 1000 series, ...).

Make sure you have Cuda and the nvidia drivers installed. We recommend using NVIDIA drivers with CUDA version 12.0 or higher. You also need to add the nvidia binaries to your path:

export PATH=$PATH:/usr/local/cuda/bin
Then run:

# This can take a while as we need to compile a lot of cuda kernels

# On Turing GPUs (T4, RTX 2000 series ... )
cargo install --path router -F candle-cuda-turing --no-default-features

# On Ampere and Hopper
cargo install --path router -F candle-cuda --no-default-features
You can now launch Text Embeddings Inference on GPU with:

model=BAAI/bge-large-en-v1.5
revision=refs/pr/5

text-embeddings-router --model-id $model --revision $revision --port 8080
