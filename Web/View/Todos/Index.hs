module Web.View.Todos.Index where
import Web.View.Prelude

data IndexView = IndexView { todos :: [Todo]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <h1>IHP Todos!<a href={pathTo NewTodoAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Todo</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach todos renderTodo}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Todos" TodosAction
                ]

renderTodo :: Todo -> Html
renderTodo todo = [hsx|
    <tr>
        <td><a href={ShowTodoAction todo.id}>{todo.title}</a></td>
        <td> {todo.createdAt |> dateTime } </td>
        <td><a href={EditTodoAction todo.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteTodoAction todo.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]