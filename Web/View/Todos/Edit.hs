module Web.View.Todos.Edit where
import Web.View.Prelude

data EditView = EditView { todo :: Todo }

instance View EditView where
    html EditView { .. } = [hsx|
        <a href={TodosAction}>Todos</a>
        <h1>Edit Todo</h1>
        {renderForm todo}
    |]

renderForm :: Todo -> Html
renderForm todo = formFor todo [hsx|
    {textField #title}
    {(textareaField #body) { helpText = "You can use Markdown here! "}}
    {submitButton}

|]