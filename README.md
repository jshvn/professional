## 💼 Josh's professional info

This repository contains the files necessary to assemble Josh's resume and a copy of his LinkedIn profile. 

This repository is a modified and simplified version of [Awesome CV](https://github.com/posquit0/Awesome-CV). For the original work please see that repository. 

The original license has been included in this repository.

## 🛠️ How to build

#### Build resume and cover letter

From the top level directory:

```bash
make
```

The generated `resume.pdf` and `coverletter.pdf` files will be placed in the [resume](./resume/) directory.

#### Clean repository objects

```bash
make clean
```

This will delete any temporary `*.aux`, `*.log`, and `*.pdf` files.
