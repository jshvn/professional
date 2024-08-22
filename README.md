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

Docker must be installed and running before building. I prefer to not install LaTeX/TeX Live on the base system, and use the [thomasweise/texlive](https://github.com/thomasWeise/docker-texlive) image instead to build the resume, CV, and cover letter.

#### Build resume, CV, and cover letter

From the top level directory:

```bash
make
```

The generated `resume.pdf`, `cv.pdf`, and `coverletter.pdf` files will be placed in the [generated/](generated/) directory.

#### GitHub Action

This repository is configured with a [GitHub action](.github/workflows/main.yml) that runs the build process and uploads the resulting documents to Cloudflare R2 for viewing over the internet. There are some secrets for the R2 bucket configured on GitHub to facilitate this process. 

#### Clean repository objects

```bash
make clean
```

This will delete any temporary `*.aux`, `*.log`, and `*.pdf` files.

## 📝 How to modify

To modify the documents, just go ahead and modify the LaTeX directly. The [resume/content](resume/content/) directory contains all of the source material used for each of the above documents. 

A custom font, montserrat, was used in the resume to match the fonts on [Josh's website](https://ijosh.com). It is located in the [resume/fonts/montserrat](resume/fonts/montserrat/) directory.

There also exists a file [PROMPTS.md](PROMPTS.md) that contains useful prompts for a GPT to create, modify, and update the document content.
