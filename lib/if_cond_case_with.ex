defmodule IfCondCaseWith do
  def if_max(a, b) do
    # Можно описывать конструкцию if else многострочно
    if a >= b do
      a
    else
      b
    end
  end

  def unless_max(a, b) do
    # макрос unless, являющийся эквивалентом конструкции if (not...)
    unless a >= b, do: b, else: a
  end

  def cond_max(a, b) do
    cond do
      a >= b -> a
      true -> b
    end
  end

  def case_max(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end

  def extract_user(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end

  defp extract_login(%{"login" => login}), do: {:ok, login}
  defp extract_login(_), do: {:error, "login missing"}
  defp extract_email(%{"email" => email}), do: {:ok, email}
  defp extract_email(_), do: {:error, "email missing"}
  defp extract_password(%{"password" => password}), do: {:ok, password}
  defp extract_password(_), do: {:error, "password missing"}
end
