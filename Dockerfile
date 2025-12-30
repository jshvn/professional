# Custom TeX Live Docker image for building professional documents
# Based on texlive/texlive:latest-small with additional packages for Awesome CV
FROM texlive/texlive:latest-small

LABEL maintainer="Josh Vaughen <josh@vaughen.net>"
LABEL description="TeX Live environment for building resume, CV, and cover letter"

# Install required TeX Live packages not included in scheme-small
# These packages are required by awesome-cv.cls and montserrat.sty
# Note: Some packages (array, multicol, ifxetex) are part of core LaTeX bundles
RUN tlmgr install \
    # Font packages
    fontawesome5 \
    sourcesanspro \
    # Layout and formatting
    enumitem \
    needspace \
    # Programming utilities
    xifthen \
    xstring \
    ifmtarg \
    # Graphics
    tcolorbox \
    environ \
    trimspaces \
    tikzfill \
    # Font configuration
    fontaxes \
    mweights \
    # Git integration for PDF metadata (gitinfo2 and its dependencies)
    gitinfo2 \
    eso-pic

# Create fontconfig cache directory with proper permissions
# This prevents "No writable cache directories" errors when running as non-root
RUN mkdir -p /tmp/fontconfig-cache && chmod 777 /tmp/fontconfig-cache
ENV FONTCONFIG_PATH=/etc/fonts
ENV XDG_CACHE_HOME=/tmp

# Set working directory
WORKDIR /doc
