# Copilot Instructions for Professional Documents Repository

## Repository Overview

This repository contains LaTeX source files for building professional documents including a **resume**, **curriculum vitae (CV)**, and **cover letter**. The LaTeX code is based on a modified and simplified version of [Awesome CV](https://github.com/posquit0/Awesome-CV).

## Project Structure

```
.
├── Taskfile.yml          # go-task build configuration
├── README.md             # Repository documentation
├── PROMPTS.md            # GPT prompts for resume customization
├── LICENSE.md            # Original Awesome CV license
├── documents/            # LaTeX source files
│   ├── resume.tex        # Main resume document
│   ├── cv.tex            # Main CV document
│   ├── coverletter.tex   # Main cover letter document
│   ├── awesome-cv.cls    # Awesome CV document class
│   ├── montserrat.sty    # Custom font style
│   ├── content/          # Modular content files
│   │   ├── configuration.tex   # Document configuration
│   │   ├── personal.tex        # Personal information
│   │   ├── education_*.tex     # Education sections
│   │   ├── experience_*.tex    # Work experience sections
│   │   ├── skills.tex          # Skills section
│   │   ├── certificates.tex    # Certifications
│   │   ├── honors.tex          # Honors and awards
│   │   └── ...                 # Other content modules
│   ├── fonts/            # Custom fonts (Montserrat)
│   └── generated/        # Output directory for built PDFs
├── linkedin/             # LinkedIn profile content (markdown)
└── .github/
    └── workflows/        # GitHub Actions for CI/CD
```

## Build System

This project uses **[go-task](https://taskfile.dev/)** for building documents. Docker is required to run the LaTeX compilation using a custom Docker image based on `texlive/texlive:latest-small`.

### Available Tasks

| Task         | Description                              |
|--------------|------------------------------------------|
| `task`       | List all available tasks (default)       |
| `task build-image` | Build the custom LaTeX Docker image (required first time) |
| `task all`   | Build resume, CV, and cover letter       |
| `task resume`| Build resume.pdf only                    |
| `task cv`    | Build cv.pdf only                        |
| `task coverletter` | Build coverletter.pdf only         |
| `task clean` | Remove generated PDFs and auxiliary files|

### Build Requirements

- **Docker**: Must be installed and running
- **go-task**: Install via `brew install go-task` on macOS

## Content Organization

The `documents/content/` directory contains modular `.tex` files that are included in the main documents:

- **`configuration.tex`**: Document-wide settings and configuration
- **`personal.tex`**: Name, contact info, social links
- **`experience_resume.tex`**: Work experience for resume (condensed)
- **`experience_cv.tex`**: Work experience for CV (detailed)
- **`education_resume.tex`**: Education for resume
- **`education_cv.tex`**: Education for CV (detailed)
- **`skills.tex`**: Technical and professional skills
- **`certificates.tex`**: Professional certifications
- **`honors.tex`**: Awards and honors
- **`coursework.tex`**: Relevant coursework
- **`organizations.tex`**: Professional memberships
- **`extracurricular.tex`**: Extracurricular activities
- **`presentation.tex`**: Presentations and talks
- **`writing.tex`**: Publications and writing
- **`aboutme.tex`**: Personal summary/about section
- **`overview.tex`**: Professional overview

## LaTeX Guidelines

When modifying content:

1. **Use the Awesome CV commands**: The `awesome-cv.cls` provides custom commands for entries like `\cventry`, `\cvhonor`, `\cvskill`, etc.
2. **Keep content modular**: Add new content as separate `.tex` files in `documents/content/`
3. **Resume vs CV**: Resume files (`*_resume.tex`) should be concise; CV files (`*_cv.tex`) can be more detailed
4. **Font**: The project uses Montserrat font for consistency with the author's website

## CI/CD

A GitHub Action automatically builds and publishes PDFs to Cloudflare R2 when changes are committed to the `main` branch. The published documents are available at:

- https://r2.ijosh.com/resume.pdf
- https://r2.ijosh.com/cv.pdf
- https://r2.ijosh.com/coverletter.pdf

## Common Tasks for Copilot

1. **Updating work experience**: Modify `documents/content/experience_resume.tex` or `experience_cv.tex`
2. **Adding new skills**: Edit `documents/content/skills.tex`
3. **Updating education**: Edit `documents/content/education_resume.tex` or `education_cv.tex`
4. **Adding certifications**: Edit `documents/content/certificates.tex`
5. **Tailoring for a job**: Use prompts from `PROMPTS.md` to customize content
6. **Building documents**: Run `task all` or individual tasks
