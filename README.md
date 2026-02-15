# Voice - Fish Speech GUI

This repository provides a convenient way to run the [Fish Speech](https://github.com/fishaudio/fish-speech) WebUI.

## Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/Abs-Asif/Voice.git
cd Voice
```

### 2. Download Model Weights
The model weights are required to run the WebUI. You can download them using the provided script.
You will need a Hugging Face token to download the gated models.

```bash
# Install huggingface_hub
pip install "huggingface_hub[cli]"

# Run the download script
./download_models.sh --token YOUR_HF_TOKEN
```

### 3. Run the WebUI
The WebUI can be run using the GitHub Action or locally if you have the dependencies installed.

#### GitHub Action
You can trigger the "Fish Speech GUI" workflow in the Actions tab. Make sure you have `HF_TOKEN` set in your repository secrets.

#### Local Execution
Follow the installation instructions in the [Fish Speech](https://github.com/fishaudio/fish-speech) repository.

```bash
# Example local run (after installing dependencies)
python -m tools.run_webui \
    --llama-checkpoint-path checkpoints/s1-mini \
    --decoder-checkpoint-path checkpoints/s1-mini/codec.pth \
    --decoder-config-name modded_dac_vq
```

## Credits
- [Fish Audio](https://fish.audio/) for the Fish Speech model.
