class Api::ContactsController < ApplicationController
  def index
    contact = Contact.select(:name, :phone, "cell_contacts.cell_address").joins(:cell_contacts).find_by(phone: params[:phone])

    if contact
      render json: {code: 0, data: contact.slice(:name, :phone, :cell_address)}
    else
      render json: {code:-1}
    end
  end
end
