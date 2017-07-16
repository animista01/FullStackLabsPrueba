class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_costumer, only: [:new, :create]
  before_action :is_support_agent, only: [:edit, :update, :export]
  before_action :is_admin, only: [:destroy]
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]


  # GET /tickets
  # GET /tickets.json
  def index
    if current_user.role_id == 1
      @tickets = Ticket.all.where(costumer_id: current_user.id)
    else
      @tickets = Ticket.all
    end
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.costumer_id = current_user.id
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      @ticket.support_agent_id = current_user.id
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export
    @tickets = Ticket.where("closed_at >= ?", 30.days.ago)

    respond_to do |format|
      format.pdf do
        pdf = ReportPdf.new(@tickets)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', disposition: "inline"
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:costumer_message, :costumer_id, :support_agent_response, :support_agent_id, :status, :closed_at)
    end
end
