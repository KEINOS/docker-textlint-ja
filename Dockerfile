FROM node:alpine

LABEL \
    org.opencontainers.image.title="Textlint-JA" \
    org.opencontainers.image.description="Textlint for technical writing in Japanese." \
    org.opencontainers.image.authors="https://github.com/KEINOS/docker-textlint-ja/graphs/contributors" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://hub.docker.com/r/keinos/textlint-ja" \
    org.opencontainers.image.documentation="https://github.com/KEINOS/docker-textlint-ja/blob/main/README.md" \
    org.opencontainers.image.source="https://github.com/KEINOS/docker-textlint-ja"

COPY package-spec /tmp/package-spec

RUN \
    apk add --no-cache \
        git \
        && \
    npm install --global \
        npm \
        npm-check-updates \
        # Install textlint
        textlint \
        # Install textlint rules
        # For more presets see: https://github.com/textlint-ja
        $(cat /tmp/package-spec) \
        && \
    npm update --global

# Create a group and user for textlint
RUN \
    addgroup -S textlint && \
    adduser -g "textlint" -S textlint -G textlint

USER textlint

# Avoid npm error: 'Tracker "idealTree" already exists'
WORKDIR /workspace

# Copy .textlintrc file
COPY textlintrc /.textlintrc

# Create new project
RUN npm init --yes

ENTRYPOINT ["npx", "textlint"]
CMD ["-h"]
