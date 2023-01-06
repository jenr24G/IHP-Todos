module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data TodosController
    = TodosAction
    | NewTodoAction
    | ShowTodoAction { todoId :: !(Id Todo) }
    | CreateTodoAction
    | EditTodoAction { todoId :: !(Id Todo) }
    | UpdateTodoAction { todoId :: !(Id Todo) }
    | DeleteTodoAction { todoId :: !(Id Todo) }
    deriving (Eq, Show, Data)
