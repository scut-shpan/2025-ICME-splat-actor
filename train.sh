# training setting
method=${1:-"Splat-Actor_BC"}
seed="0"
train_gpu=${2:-"0,1"}
train_gpu_list=(${train_gpu//,/ })
port=${3:-"12360"}
use_wandb=True
wandb_project="Splat-Actor_BC-peract"
wandb_group="A800"
wandb_name="Splat-Actor_BC"
batch_size=1
num_workers=6
tasks=[close_jar,open_drawer,sweep_to_dustpan_of_size,meat_off_grill,turn_tap,slide_block_to_color_target,put_item_in_drawer,reach_and_drag,push_buttons,stack_blocks]
episodes=20
num_views=20
render_freq=1000
training_iterations=300010
demo_augmentation=true
transform_augmentation=True

# model setting
selected_mask=True
multi_concat=True
use_neural_rendering=True
diffusion='diffusion'
use_depth=True
warm_up=3000

# we set experiment name as method+date. you could specify it as you like.
addition_info="$(date +"%Y-%m-%d-%H-%M-%S")"
exp_name=${4:-"${addition_info}_${method}"}
base_dir="/results/Splat_Actor/peract"
log_dir="${base_dir}/${exp_name}"
replay_dir="${log_dir}/replay"
train_demo_path="/datasets/Peract"

# override hyper-params in config.yaml
CUDA_VISIBLE_DEVICES=${train_gpu} python train.py method=$method \
rlbench.task_name=${exp_name} \
rlbench.demo_path=${train_demo_path} \
replay.path=${replay_dir} \
framework.start_seed=${seed} \
framework.log_dir=${log_dir} \
framework.training_iterations=${training_iterations} \
framework.num_workers=${num_workers} \
framework.use_wandb=${use_wandb} \
method.use_wandb=${use_wandb} \
framework.wandb_project=${wandb_project} \
framework.wandb_name=${wandb_name} \
framework.wandb_group=${wandb_group} \
ddp.num_devices=${#train_gpu_list[@]} \
replay.batch_size=${batch_size} \
ddp.master_port=${port} \
rlbench.tasks=${tasks} \
rlbench.demos=${episodes} \
method.num_view_for_nerf=${num_views} \
rlbench.num_view_for_nerf=${num_views} \
method.transform_augmentation.apply_se3=${transform_augmentation} \
method.use_neural_rendering=${use_neural_rendering} \
method.neural_renderer.render_freq=${render_freq} \
method.neural_renderer.foundation_model_name=${diffusion} \
method.neural_renderer.use_depth=${use_depth} \
method.neural_renderer.next_mlp.warm_up=${warm_up} \
method.common.selected_mask=${selected_mask} \
method.common.multi_concat=${multi_concat} \
method.demo_augmentation=${demo_augmentation} \
