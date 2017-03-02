from spack import *
from distutils.dir_util import copy_tree


class Fiji(Package):
    """Fiji: an image processing package - a "batteries-included" distribution of ImageJ, bundling a lot of plugins which facilitate scientific image analysis.."""

    homepage = "https://imagej.net/Fiji"
    url      = "http://downloads.imagej.net/fiji/latest/fiji-linux64.zip"

    version('2.0.0-rc-54', 'f2070370ab9bec98f9ad95c195e54551', url='http://downloads.imagej.net/fiji/latest/fiji-linux64.zip')

    # FIXME: Add dependencies if required.
    # depends_on('foo')

    sanity_check_is_file = ['ImageJ-linux64']
    
    def install(self, spec, prefix):
        copy_tree('.', join_path(prefix))

    def setup_environment(self, spack_env, run_env):
        run_env.prepend_path('PATH', join_path(self.prefix))
