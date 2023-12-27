#!/bin/bash
# Parse command line arguments
while [ $# -gt 0 ]; do
  case "$1" in
    --param1)
      PARAM1="$2"
      shift 2
      ;;
    --param2)
      PARAM2="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

# Use the parameters in your script logic
#echo "PARAM1 is set to: $PARAM1"
#echo "PARAM2 is set to: $PARAM2"

model=BAAI/bge-large-en-v1.5
revision=refs/pr/5
#volume=./data
#docker pull ghcr.io/huggingface/text-embeddings-inference:cpu-latest
#docker run --gpus all -p 8080:80 -v $volume:/data  ghcr.io/huggingface/text-embeddings-inference:cpu-latest --model-id $model --revision $revision
#docker run -it --name te  text-embed:1.0
#CMD ["text-embeddings-router", "--model-id ", "/tmp/${PARAM1}", "--revision", "${PARAM2}", "--port","8080"]
./text-embeddings-router --model-id $model --revision $revision --port 8080
#--pooling cls
