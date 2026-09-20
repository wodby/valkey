# Base image inputs shared by local builds and CI. Updated by wodby/images.
# Each digest identifies the complete multi-platform image index.
BASE_IMAGE_REPOSITORY := valkey/valkey
BASE_IMAGE_VERSION_SUFFIX := -alpine

BASE_IMAGE_DIGEST_7.2.14-alpine := sha256:9acdf6f0ae1771ea63c401e127054b2d1779227b9230dcfae37fa684610eaa4f
BASE_IMAGE_DIGEST_8.0.11-alpine := sha256:656173190c39393f2ba848d7cb29a059df345bfc85b40df8fa1795ab9daeabd8
BASE_IMAGE_DIGEST_8.1.10-alpine := sha256:d2e18f3410b6f616de1417f570fa55261af2898b9c5b2cfb6781ce2373ea43d1
BASE_IMAGE_DIGEST_9.0.6-alpine := sha256:03b0430961fd824180fe21d0728238e5711cba8a7afcfd7b01a8451a754e2a1a

# Fail before building when a version or variant has no reviewed pin.
BASE_IMAGE = $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG)@$(or $(BASE_IMAGE_DIGEST_$(BASE_IMAGE_TAG)),$(error No base image digest for $(BASE_IMAGE_REPOSITORY):$(BASE_IMAGE_TAG); update base-images.mk))
