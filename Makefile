OUTPUT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER = docker run --rm --user $(shell id -u):$(shell id -g) -i -w "/doc" -v "$(OUTPUT_DIR)":/doc thomasweise/texlive
CC = xelatex
RESUME_DIR = resume
CONTENT_DIR = resume/content
RESUME_SRCS = $(shell find $(CONTENT_DIR) -name '*.tex')

all: $(foreach x, coverletter resume cv, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	# mv $(RESUME_DIR)/resume.pdf $(OUTPUT_DIR)

coverletter.pdf: $(RESUME_DIR)/coverletter.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	# mv $(RESUME_DIR)/coverletter.pdf $(OUTPUT_DIR)

cv.pdf: $(RESUME_DIR)/cv.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<
	# mv $(RESUME_DIR)/cv.pdf $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(RESUME_DIR)/*.pdf $(RESUME_DIR)/*.log $(RESUME_DIR)/*.aux