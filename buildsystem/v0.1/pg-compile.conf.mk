# vim: ft=make ts=4 sw=4 noet
#
# The contents of this file are subject to the Apache 2.0 license you may not 
# use this file except in compliance with the License.
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
# for the specific language governing rights and limitations under the
# License.
#
#
#
# Copyright 2015 William BONNET (https://github.com/wbonnet/pg-compile).
# All rights reserved. Use is subject to license terms.
#
# Even if this work is a complete rewrite, it is originally derivated work based 
# upon mGAR build system from OpenCSW project (http://www.opencsw.org).
#
# Copyright 2001 Nick Moffitt: GAR ports system
# Copyright 2006 Cory Omand: Scripts and add-on make modules, except where otherwise noted.
# Copyright 2008 Dagobert Michelsen (OpenCSW): Enhancements to the CSW GAR system
# Copyright 2008-2013 Open Community Software Association: Packaging content
#
#
#
# Contributors list :
#
#    William Bonnet 	wllmbnnt@gmail.com
#
#


# ------------------------------------------------------------------------------
#
# Retrieves informations about the host used to build the softwares
#
# ------------------------------------------------------------------------------

BUILDER_HOSTNAME                 := $(shell uname -n)
BUILDER_ARCHITECTURE             := $(shell uname -s | tr '[:upper:]' '[:lower:]')-$(shell uname -m | tr '[:upper:]' '[:lower:]')
BUILDER_OPERATING_SYSTEM         := $(shell uname -s | tr '[:upper:]' '[:lower:]')
BUILDER_OPERATING_SYSTEM_FLAVOR  := $(word 3, $(shell lsb_release -i | tr '[:lower:]' '[:upper:]'))
BUILDER_OPERATING_SYSTEM_VERSION := $(word 2, $(shell lsb_release -c | tr '[:lower:]' '[:upper:]'))


# ------------------------------------------------------------------------------
#
# Defines the set of variables used for the PostgreSQL project
#
# ------------------------------------------------------------------------------

PG_SITE     = ftp://ftp.postgresql.org/pub/source


# ------------------------------------------------------------------------------
#
# Defines the set of variables used for pgFoundry project softwares 
#
# ------------------------------------------------------------------------------

PG_FOUNDRY_SITE     = ftp://ftp.postgresql.org/pub/projects/pgFoundry/
PG_FOUNDRY_ROOT     = $(PG_FOUNDRY_SITE)
PG_FOUNDRY_VERSION ?= $(SOFTWARE_VERSION)
PG_FOUNDRY_MIRROR   = $(PG_FOUNDRY_ROOT)/$(PG_FOUNDRY_PROJECT)/


# ------------------------------------------------------------------------------
#
# Defines the default values for directories
#
# ------------------------------------------------------------------------------

BASE_DIR            ?= $(CURDIR)
FILE_DIR            ?= files
PATCH_DIR           ?= patches
WORK_ROOT_DIR       ?= work
WORK_DIR            ?= $(WORK_ROOT_DIR)/build-$(BUILDER_ARCHITECTURE)
DOWNLOAD_DIR        ?= $(WORK_ROOT_DIR)/download
PARTIAL_DIR         ?= $(DOWNLOAD_DIR)/partial
COOKIE_DIR          ?= $(WORK_ROOT_DIR)/cookies-$(BUILDER_ARCHITECTURE)
EXTRACT_DIR         ?= $(WORK_DIR)
WORK_SRC            ?= $(WORK_DIR)/$(SOFTWARE_FULLNAME)
OBJ_DIR             ?= $(WORK_SRC)
INSTALL_DIR         ?= $(WORK_ROOT_DIR)/install-$(BUILDER_ARCHITECTURE)
TEMP_DIR            ?= $(WORK_DIR)/tmp
CHECKSUM_FILE       ?= checksums
LOG_DIR             ?= log

# Defines the default targets used for building
CONFIGURE_SCRIPTS   ?= $(WORK_SRC)/configure
BUILD_SCRIPTS       ?= $(WORK_SRC)/Makefile

# prepend the local file listing
#FILE_SITES = $(foreach DIR,$(FILEDIR) $(GARCHIVEPATH),file://$(DIR)/)
