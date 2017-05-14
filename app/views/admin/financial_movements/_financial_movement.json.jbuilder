json.extract! financial_movement, :id, :amount, :description, :created_at, :updated_at
json.url financial_movement_url(financial_movement, format: :json)
