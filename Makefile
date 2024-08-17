GIT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER = docker run --rm --user $(shell id -u):$(shell id -g) -i -w "/doc" -v "$(GIT_DIR)":/doc thomasweise/texlive
CC = xelatex
RESUME_DIR = resume
CONTENT_DIR = resume/content
OUTPUT_DIR = generated

all: $(foreach x, coverletter resume cv, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	mv $(RESUME_DIR)/resume.pdf $(OUTPUT_DIR)

coverletter.pdf: $(RESUME_DIR)/coverletter.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	mv $(RESUME_DIR)/coverletter.pdf $(OUTPUT_DIR)

cv.pdf: $(RESUME_DIR)/cv.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	mv $(RESUME_DIR)/cv.pdf $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(RESUME_DIR)/*.pdf $(RESUME_DIR)/*.log $(RESUME_DIR)/*.aux