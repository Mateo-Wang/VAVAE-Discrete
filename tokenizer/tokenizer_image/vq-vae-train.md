**vq-vae训练流程**

0. 切换到项目根目录，在终端输入

   ```bash
   export PYTHONPATH=.
   ```

1. 训练vq-vae脚本（想要尝试--adaptive-disc的两种设置，看哪种效果好）

   ```bash
   bash scripts/tokenizer/train_vq.sh --data-path /path/to/imagenet-1k/train/  --result-dir /path/to/save/checkpoint --adaptive-disc True/or False
   ```

2. 用训练好的vq-vae得到验证集上的重建结果，会得到重建后的图片和一个npz文件

   ```bash
   bash scripts/tokenizer/reconstruction_vq.sh --data-path /path/to/imagenet-1k/val/ --vq-ckpt /path/to/vq_ckpt --sample-dir /path/to/save/reconstruction_result
   ```

3. 获取计算rfid时需要用到的reference_npz

   ```bash
   bash scripts/tokenizer/val.sh --data-path /path/to/imagenet-1k/val/ --sample-dir /path/to/save/rfid_reference_npz
   ```

4. 计算rfid

   ```bash
   python evaluations/c2i/evaluator.py /path/to/rfid_reference_npz /path/to/vq_reconstruction_npz
   ```

   