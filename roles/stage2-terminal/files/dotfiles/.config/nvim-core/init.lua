local coreplugs = require("mps-core.init").getplugins()

require("mps-core.helpers").initLazy()
require("lazy").setup({ coreplugs, toolplugs, uiplugs }, {})

-- Core
require("mps-core.init").configure()

