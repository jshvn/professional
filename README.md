## 💼 Josh's professional info

This repository contains a LaTeX project that is used to assemble my resume, curriculum vitae, and cover letter. It also contains a markdown document with a copy of the information from my LinkedIn profile.

The LaTeX code is a modified and simplified version of [Awesome CV](https://github.com/posquit0/Awesome-CV). For the original work please see that repository. 

The original license has been included in this repository.

## 📃 Latest copies of resume

There exists a GitHub Action that automatically builds and publishes a copy of my `resume.pdf`, `cv.pdf`, and `coverletter.pdf` to Cloudflare R2 every time a change is committed to the `master` branch of this repository.

Each PDF can be accessed publicly here:

* [resume.pdf](https://r2.ijosh.com/resume.pdf)
* [cv.pdf](https://r2.ijosh.com/cv.pdf)
* [coverletter.pdf](https://r2.ijosh.com/coverletter.pdf)

## 🛠️ How to build

### Prerequisites

- **Docker** must be installed and running. This project uses a custom Docker image based on [texlive/texlive:latest-small](https://hub.docker.com/r/texlive/texlive) with additional LaTeX packages required for building the documents.
- **[go-task](https://taskfile.dev/)** must be installed. Install via Homebrew: `brew install go-task` or see [installation docs](https://taskfile.dev/installation/).

#### Build the Docker image (first time only)

Before building documents for the first time, you need to build the custom Docker image:

```bash
task build-image
```

This creates a local Docker image named `jshvn-texlive` with all required TeX Live packages.

#### List available tasks

```bash
task
```

#### Build resume, CV, and cover letter

From the top level directory:

```bash
task all
```

The generated `resume.pdf`, `cv.pdf`, and `coverletter.pdf` files will be placed in the [generated/](generated/) directory.

#### Build individual documents

```bash
task resume      # Build resume.pdf only
task cv          # Build cv.pdf only
task coverletter # Build coverletter.pdf only
```

#### GitHub Action

This repository is configured with a [GitHub action](.github/workflows/main.yml) that runs the build process and uploads the resulting documents to Cloudflare R2 for viewing over the internet. There are some secrets for the R2 bucket configured on GitHub to facilitate this process. 

#### Clean repository objects

```bash
task clean
```

This will delete any temporary `*.aux`, `*.log`, and `*.pdf` files.

## 📝 How to modify

To modify the documents, just go ahead and modify the LaTeX directly. The [documents/content](documents/content/) directory contains all of the source material used for each of the above documents. 

A custom font, montserrat, was used in the resume to match the fonts on [Josh's website](https://ijosh.com). It is located in the [documents/fonts/montserrat](documents/fonts/montserrat/) directory.