module Web.View.Todos.Show where
import Web.View.Prelude

import qualified Text.MMark as MMark

data ShowView = ShowView { todo :: Todo }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <a href={TodosAction}>Todos</a>
        <h1>{ todo.title }</h1>
        <p> { todo.createdAt |> timeAgo } </p>
        <p> { todo.body |> renderMarkdown |> preEscapedToHtml }</p>

    |]
        where
            renderMarkdown text = case text |> MMark.parse "" of
                Left error -> "Something went wrong: " ++ (show error)
                Right markdown -> MMark.render markdown |> tshow