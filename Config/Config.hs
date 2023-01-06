module Config where

import IHP.Prelude
import IHP.Environment
import IHP.FrameworkConfig
import Web.View.CustomCSSFramework (customTailwind)

config :: ConfigBuilder
config = do
    option Development
    option (AppHostname "localhost")
    option customTailwind