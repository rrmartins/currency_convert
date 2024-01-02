defmodule CurrencyConvert.MixProject do
  use Mix.Project

  def project do
    [
      app: :currency_convert,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, "~> 0.18", only: :dev},
      {:httpoison, "~> 1.7"},
      {:jason, "~> 1.2"}
    ]
  end

  defp description do
    """
    An Elixir library for converting currencies.
    """
  end

  defp package do
    [
      files: ["lib"],
      maintainers: ["Rodrigo Martins"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/rrmartins/currency_convert"}
    ]
  end
end
