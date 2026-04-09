## Docker Setup for OIR Repository

This repository has been containerized to simplify setup and ensure it runs reliably on modern systems. The original code depends on a legacy Torch (Lua) environment, which can be difficult to install natively. Using Docker allows the environment to be reproduced consistently across machines.

---

## Requirements

* Docker installed on your system
  https://www.docker.com/

---

## Build Instructions

From the root of the repository, build the Docker image:

```
docker build -t oir .
```

Alternatively, on Windows you can use:

```
build_oir_image.bat
```

---

## Example Usage

### Command Line

Run inference on a single image:

```
docker run --rm \
  -v /path/to/images:/data/input \
  -v /path/to/output:/data/output \
  oir \
  th predict.lua \
  --imageFile /data/input/example.png \
  --outputdir /data/output
```

* Replace `/path/to/images` with your input image directory
* Replace `/path/to/output` with where you want results saved
* Output files (e.g., `.json`, `.png`) will appear in the output directory

---

### Python Example (Optional)

```
import subprocess

cmd = [
    "docker", "run", "--rm",
    "-v", "/path/to/images:/data/input",
    "-v", "/path/to/output:/data/output",
    "oir",
    "th", "predict.lua",
    "--imageFile", "/data/input/example.png",
    "--outputdir", "/data/output",
]

subprocess.run(cmd, check=True)
```

---

## Running the Container

You can adapt the example above to process multiple images or integrate into a larger workflow as needed.

---

## Notes on Dependencies

This repository includes a `vendor/` directory containing legacy dependencies required for the build. Some of these dependencies are no longer easily installable through standard package managers, so they are included to ensure reproducibility.

---

## Purpose

This Docker setup is intended to:

* Provide a reproducible environment for running the original OIR code
* Avoid issues with outdated or incompatible dependencies
* Enable easier integration into modern pipelines

---

## Future Work

While this setup allows the legacy code to run, a longer-term improvement would be to reimplement the model in a modern framework (e.g., PyTorch) for easier maintenance, improved performance, and simpler integration.
