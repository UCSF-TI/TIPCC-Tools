##############################################################################
# Copyright (c) 2013-2016, Lawrence Livermore National Security, LLC.
# Produced at the Lawrence Livermore National Laboratory.
#
# This file is part of Spack.
# Created by Todd Gamblin, tgamblin@llnl.gov, All rights reserved.
# LLNL-CODE-647188
#
# For details, see https://github.com/llnl/spack
# Please also see the LICENSE file for our notice and the LGPL.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License (as
# published by the Free Software Foundation) version 2.1, February 1999.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the IMPLIED WARRANTY OF
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the terms and
# conditions of the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##############################################################################
#
# This is a template package file for Spack.  We've put "FIXME"
# next to all the things you'll want to change. Once you've handled
# them, you can save this file and test your package like this:
#
#     spack install asciigenome
#
# You can edit this file again by typing:
#
#     spack edit asciigenome
#
# See the Spack documentation for more information on packaging.
# If you submit this package back to Spack as a pull request,
# please first remove this boilerplate and all FIXME comments.
#
from spack import *
import os


class Asciigenome(Package):
    """ASCIIGenome: Text only genome viewer!  ASCIIGenome is a genome browser based on command line interface and designed for console terminals."""

    homepage = "http://asciigenome.readthedocs.io/"
    url      = "https://github.com/dariober/ASCIIGenome/releases/download/v1.0.0/ASCIIGenome-1.0.0.zip"

    version('1.0.0', 'ec5c0d369582c5f028ad55cf49101a30')

    # FIXME: Add dependencies if required.
    # depends_on('foo')

    sanity_check_is_file = ['ASCIIGenome', 'ASCIIGenome.jar']
    
    def install(self, spec, prefix):
        os.chmod('ASCIIGenome', 0o755)  # ugo+rx u+w
        install('ASCIIGenome', join_path(prefix))
        install('ASCIIGenome.jar', join_path(prefix))

    def setup_environment(self, spack_env, run_env):
        run_env.prepend_path('PATH', join_path(self.prefix))
