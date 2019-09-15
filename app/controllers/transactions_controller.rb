class TransactionsController < ApplicationController
  # POST /transaction/check_ticket_quota
  def check_ticket_quota
    ticket_quota = Ticket.select(:id, :amount).find(params[:ticket_id])
    ticket_sold = Transaction.where(ticket_id: params[:ticket_id]).count
    ticket_left = ticket_quota[:amount] - ticket_sold

    check_ticket_quota_result = (ticket_left < 1 ? false : true)

    message = (check_ticket_quota_result ? "We still have #{ticket_left} ticket left" : "Sold Out")

    check_response = {
        status: "ok",
        success: "true",
        errors: [],
        data: [{
                ticket_quota: ticket_quota[:amount],
                ticket_sold: ticket_sold,
                ticket_left: ticket_left,
                ticket_available: check_ticket_quota_result,
                message: message
            }]
    }
    json_response(check_response, :ok)
  end

  # POST /transaction/purchase
  def purchase
    if ticket_available(transaction_params)
      @transaction = Transaction.create!(transaction_params)
      # json_response(@transaction, :created)
    else
      error_response = { status: "ok", success: "false", errors: ["Invalid parameters"], data: [] }
      json_response(error_response, :ok)
    end
  end

  # GET /transaction/get_info/:customer_id
  def get_info
    @get_info = Customer.left_outer_joins(transactions: :ticket).find_by(id: params[:customer_id])
  end

  private

  def ticket_available(params)
    return false if params == {} # customer should not be able to buy ticket(s) with invalid /unpermitted params

    ticket_quota = Ticket.select(:id, :amount).find(params[:ticket_id])
    ticket_sold = Transaction.where(ticket_id: params[:ticket_id]).count
    ticket_left = ticket_quota[:amount] - ticket_sold
    (ticket_left < 1) ? false : true
  end

  def transaction_params
    # whitelist params
    params.permit(:customer_id, :ticket_id, :amount)
  end
end
