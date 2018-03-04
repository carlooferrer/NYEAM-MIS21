class CustomerController < ApplicationController
    def index
        @customer = Customer.where(status: true)
    end
end
