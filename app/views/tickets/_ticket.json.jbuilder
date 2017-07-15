json.extract! ticket, :id, :costumer_message, :costumer_id, :support_agent_response, :support_agent_id, :status, :closed_at, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
