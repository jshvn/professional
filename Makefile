DOCKER = docker run --rm --user $(id -u):$(id -g) -i -w "/doc" -v "$(shell PWD)":/doc thomasweise/texlive
CC = xelatex
RESUME_DIR = resume
CONTENT_DIR = resume/content
RESUME_SRCS = $(shell find $(CONTENT_DIR) -name '*.tex')

all: $(foreach x, coverletter resume, $x.pdf)

resume.pdf: $(RESUME_DIR)/resume.tex $(RESUME_SRCS)
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<

coverletter.pdf: $(RESUME_DIR)/coverletter.tex
	$(DOCKER) $(CC) -output-directory=$(RESUME_DIR) $<

clean:
	rm -rf $(RESUME_DIR)/*.pdf $(RESUME_DIR)/*.log $(RESUME_DIR)/*.aux