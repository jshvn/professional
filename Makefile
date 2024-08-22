GIT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DOCKER = docker run --rm --user $(shell id -u):$(shell id -g) -i -w "/doc" -v "$(GIT_DIR)":/doc thomasweise/texlive
CC = xelatex
DOCUMENTS_DIR = documents
OUTPUT_DIR = generated

all: $(foreach x, coverletter resume cv, $x.pdf)

resume.pdf: $(DOCUMENTS_DIR)/resume.tex
	$(DOCKER) $(CC) -output-directory=$(DOCUMENTS_DIR) $<
	mv $(DOCUMENTS_DIR)/resume.pdf $(OUTPUT_DIR)

coverletter.pdf: $(DOCUMENTS_DIR)/coverletter.tex
	$(DOCKER) $(CC) -output-directory=$(DOCUMENTS_DIR) $<
	mv $(DOCUMENTS_DIR)/coverletter.pdf $(OUTPUT_DIR)

cv.pdf: $(DOCUMENTS_DIR)/cv.tex
	$(DOCKER) $(CC) -output-directory=$(DOCUMENTS_DIR) $<
	mv $(DOCUMENTS_DIR)/cv.pdf $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf $(DOCUMENTS_DIR)/*.pdf $(DOCUMENTS_DIR)/*.log $(DOCUMENTS_DIR)/*.aux