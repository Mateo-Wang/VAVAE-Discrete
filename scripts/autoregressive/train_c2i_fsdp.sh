# !/bin/bash
set -x

# ===== 单机多卡配置 =====
nnodes=1
nproc_per_node=4        # 对应4张3090，每张卡1个进程
node_rank=0             # 单机情况下就是0
master_addr=127.0.0.1   # 本机地址
master_port=12355       # 随便填个不冲突的端口

torchrun \
--nnodes=$nnodes --nproc_per_node=$nproc_per_node --node_rank=$node_rank \
--master_addr=$master_addr --master_port=$master_port \
autoregressive/train/train_c2i_fsdp.py "$@"
