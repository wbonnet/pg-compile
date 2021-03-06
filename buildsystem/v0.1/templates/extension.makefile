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

# Defines the software version
SOFTWARE_VERSION = $*

# Include software common definitions
include $(SOFTWARE_UPSTREAM_NAME).mk

# Defines the upstream software name
SOFTWARE_UPSTREAM_NAME ?= %%SOFTWARE_UPSTREAM_NAME%%

# If this software is a PG_FOUNDRY project, then set the variable
# PG_FOUNDRY_PROJECT = $(SOFTWARE_UPSTREAM_NAME)

# Include the build system root makefile
include buildsystem/pg-compile.mk
