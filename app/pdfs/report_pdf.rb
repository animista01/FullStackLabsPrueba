class ReportPdf < Prawn::Document
  def initialize(tickets)
    super()
    @tickets = tickets
    table_content
  end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.row_colors = ['DDDDDD', 'FFFFFF']
      # self.column_widths = [40, 300, 200]
    end
  end

  def product_rows
    [['#', 'Costumer message', 'Costumer id', 'support agent response', 'support agent id', 'status', 'closed_at', 'created_at', 'updated_at']] +
      @tickets.map do |ticket|
      [ticket.id.to_s, ticket.costumer_message.to_s, ticket.costumer_id.to_s, ticket.support_agent_response.to_s, ticket.support_agent_id.to_s, ticket.status.to_s, ticket.closed_at.to_s, ticket.created_at.to_s, ticket.updated_at.to_s]
    end
  end
end