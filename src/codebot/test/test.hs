import Test.Tasty
import Test.Tasty.HUnit

import Tests.Command
import Tests.Execution

main = defaultMain
    $ testGroup "General"
        [commands, execution]
