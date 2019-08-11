defmodule Machinery.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views, models and routes
  """

  def model do
    quote do
      # Define common model functionality
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      import Plug.Conn
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      alias Machinery.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
