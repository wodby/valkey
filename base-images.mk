# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := valkey/valkey
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.2.16-alpine := sha256:3056ae42eccb4cf4ef5e5a403a68f6dbd8038774456086c152961bb79a467c6d
BASE_IMAGE_DIGEST_8.0.12-alpine := sha256:19f0b3d350f5e6de618086d79ecdc9c474ab159bebb16ed95a92e4211562fee5
BASE_IMAGE_DIGEST_8.1.11-alpine := sha256:2602ace2be6569bc2bbb06f873776516ab9089821525be34f4305c67eb9db02a
BASE_IMAGE_DIGEST_9.0.7-alpine := sha256:2d04268dfa26ab31cfa3fdc538866e76438b2d00e41db41b8cb86d780ac5a416
BASE_IMAGE_DIGEST_9.1.4-alpine := sha256:56729e68bdda139cbd3f6a2538683dc3523325fc5711ea1a379938f1b37893f0

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
