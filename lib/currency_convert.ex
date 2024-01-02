defmodule CurrencyConvert do
  @moduledoc """
  Documentation for `CurrencyConvert`.
  """

  # API URL
  @rates_url "https://api.exchangerate-api.com/v4/latest/"

  def convert(amount, from_currency, to_currency) do
    get_rates(from_currency, to_currency)
    |> handle_rates()
    |> convert_amount(amount, to_currency, from_currency)
  end

  defp get_rates(from_currency, to_currency) do
    # Get the rates from the API
    case HTTPoison.get("#{@rates_url}#{from_currency}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)["rates"]}

      {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
        {:error, "Request failed with status code #{status_code} and message #{body}"}

      {:error, error} ->
        # Return the error
        error
    end
  end

  defp handle_rates(:ok, rates) do
    # Return the rates
    rates
  end

  defp handle_rates(error), do: error

  defp convert_amount({:error, error}, _rates, _to_currency, _from_currency) do
    # Return the error
    raise "Error: #{error}"
  end

  defp convert_amount(rates, amount, to_currency, from_currency) do
    # Convert the amount
    amount * Map.get(rates, to_currency) / Map.get(rates, from_currency)
  end
end
