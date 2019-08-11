defmodule Machinery.Mixfile do
  use Mix.Project

  def project do
    [
      app: :machinery,
      version: "0.17.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      compilers: [:phoenix] ++ Mix.compilers,
      description: description(),
      package: package(),
      source_url: "https://github.com/joaomdmoura/machinery",
      docs: [
        main: "Machinery",
        logo: "logo.png",
        extras: ["README.md"]
      ],
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {Machinery, []},
     env: [{Machinery.Endpoint, []}],
     applications: [:phoenix, :phoenix_html, :cowboy]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "~> 1.4"},
      {:phoenix_html, "~> 2.11"},
      {:plug_cowboy, "~> 2.0"},
      {:excoveralls, "~> 0.11", only: :test},
      {:ecto, "~> 3.1"},
      {:jason, "~> 1.0"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:basic_auth, "~> 2.2", optional: true}
    ]
  end

  defp description() do
    "Machinery is a State Machine library for structs in general.
    It supports guard clauses, callbacks and integrate out of the box
    with Phoenix apps."
  end

  defp package() do
    [
      maintainers: ["João M. D. Moura"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/joaomdmoura/machinery"}
    ]
  end
end

# Failed to use "cowboy" because
#   machinery (version 0.17.0) requires ~> 1.0
#   mix.lock specifies 2.6.1
