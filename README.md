# Agnez-Torch
Lua/Torch API for Agnez

# Dev guidelines
This package should use as much as possible the solutions already available to
the Torch ecosystem. For example, it should use `image` for generating images
and grids. Otherwise the primary plans are to simply make Python calls
(possibly using [fblualib.python](https://github.com/facebook/fblualib/tree/master/fblualib/python))
to [Agnez](https://github.com/AgnezIO/agnez)'s main library.
