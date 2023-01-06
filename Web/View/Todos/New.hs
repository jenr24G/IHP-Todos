module Web.View.Todos.New where
import Web.View.Prelude

data NewView = NewView { todo :: Todo }

instance View NewView where
    html NewView { .. } = [hsx|
        <a href={TodosAction}>Todos</a>
        <h1>New Todo</h1>
        {renderForm todo}
    |]

renderForm :: Todo -> Html
renderForm todo = formFor todo [hsx|
    {(textField #title)}
    {(textareaField #body) { helpText = "You can use Markdown here! "}}
    {submitButton}
|]