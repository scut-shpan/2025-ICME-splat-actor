# 2025-ICME-ID-526:
We have uploaded the model and training code associated with this paper, accompanied by brief instructions. A comprehensive README will be provided in due course. Additionally, we plan to progressively release the code for data generation, model validation, and data visualization.

### Environment setup 
0. Hardware
> Our experiments were conducted on the PyTorch deep learning platform utilizing two $A800$ GPUs on Ubuntu20.04 with CUDA version 11.7.

1. gcc version
> scl enable devtoolset-9 bash

2. conda environment
> conda create -n splatactor python=3.9
conda activate splatactor

3. pytorch
>conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.7 -c pytorch -c nvidia

4. pytorch3d
> git clone https://github.com/facebookresearch/pytorch3d.git
cd pytorch3d
conda install -c fvcore -c iopath -c conda-forge fvcore iopath
pip install -e .

5. CLIP
> git clone https://github.com/openai/CLIP.git
cd CLIP
pip install -e .
pip install open-clip-torch

6. coppeliasim 
> Download CoppeliaSim from https://www.coppeliarobotics.com/previousVersions

7. PyRep
> git clone https://github.com/stepjam/PyRep.git
pip install -r requirements.txt
pip install .

8. RLBench
> git clone https://github.com/stepjam/RLBench.git
pip install -r requirements.txt
python setup.py develop

9. YARR
> git clone https://github.com/stepjam/YARR.git
pip install -r requirements.txt
pip install .

10. odise
> git clone 
pip install xformers
git clone https://github.com/facebookresearch/detectron2.git
cd detectron2
pip install -e .
git clone https://github.com/NVlabs/ODISE.git
pip install -r requirements.txt
pip install .

11. Gaussian Splatting Renderer
> git clone https://github.com/graphdeco-inria/diff-gaussian-rasterization.git
git clone https://github.com/graphdeco-inria/gaussian-splatting/blob/main/submodules/simple-knn.git
pip install -e submodules/diff-gaussian-rasterization
pip install -e submodules/simple-knn

12. other packages
> pip install packaging==21.3 dotmap pyhocon wandb==0.14.0 chardet opencv-python-headless gpustat ipdb visdom sentencepiece lightning