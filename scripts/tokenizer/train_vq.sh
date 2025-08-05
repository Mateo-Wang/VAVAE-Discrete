# !/bin/bash
set -x

# 默认配置：单机 4 卡训练
nnodes=1
nproc_per_node=4
node_rank=0
master_addr=127.0.0.1
master_port=29500  # 如被占用可换其他端口

torchrun \
--nnodes=$nnodes --nproc_per_node=$nproc_per_node --node_rank=$node_rank \
--master_addr=$master_addr --master_port=$master_port \
tokenizer/tokenizer_image/vq_train.py "$@"