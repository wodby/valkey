# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := valkey/valkey
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.2.14-alpine := sha256:c6c2f0020be34bbf684a53a0ef716ab16ff70295186d4d9f2518435beb7afbff
BASE_IMAGE_DIGEST_8.0.11-alpine := sha256:fd348c9b6999ef15719a1d6b43b810ee1bf2068ded2d7ab6f6dd15943841f28b
BASE_IMAGE_DIGEST_8.1.10-alpine := sha256:081c2f5cb575efc901aa80ff9cdbd1ec6a301682fd35e1ebb4b0990a4a4a8507
BASE_IMAGE_DIGEST_9.0.6-alpine := sha256:187679e3bd4036959631e3f03983ab2ba503ab21e6fd0454d508e909db2ee989

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
