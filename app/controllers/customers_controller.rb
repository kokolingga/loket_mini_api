class CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  # GET /customers
  def index
    @customers = Customer.all
    json_response(@customers)
  end

  # GET /customers/:id
  def show
    json_response(@customer)
  end

  # POST /customer/create
  def create
    @customer = Customer.create!(customer_params)
    json_response(@customer, :created)
  end

  private

  def customer_params
    # whitelist params
    params.permit(:first_name, :last_name, :email, :phone)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
