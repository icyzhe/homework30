#!/bin/bash

MODELS=("MLP" "ResNet" "ViT")
AUGMENTATIONS=("original" "aug1" "aug2" "aug3")
# PARTIAL_OBS=("True")
# SEEDS=($(seq 0 9))
# NUM_ENVS_POWERS=($(seq 1 9))
# NUM_STEPS=32

# Loop over each setting combination
for model in "${MODELS[@]}"; do
    for aug in "${AUGMENTATIONS[@]}"; do
        # for power in "${NUM_ENVS_POWERS[@]}"; do
            # Calculate number of environments using 2^power
            # n_envs=$(echo "2^$power" | bc)
            
            # Export environment variables
            # export ENV_NAME="$env_name"
            # export SEED="$seed"
            # export NUM_ENVS="$n_envs"
            # export NUM_STEPS="$NUM_STEPS"
            export MODEL="$model"
            export AUGMENTATION="$aug"
            
            # echo "Running experiment with ENV_NAME=$ENV_NAME, SEED=$SEED, NUM_ENVS=$NUM_ENVS, NUM_STEPS=$NUM_STEPS"
            echo "Running experiment with MODEL=$MODEL, AUGMENTATION=$AUGMENTATION"
            python homework.py

            # echo "Cleaning up leftover GPU processes..."
            # pids=$(nvidia-smi | awk '/python/ {print $5}')
            # for pid in $pids; do
            #     echo "Killing process with PID $pid"
            #     kill -9 $pid 2>/dev/null
            # done
        # done
    done
done

echo "All experiments complete."