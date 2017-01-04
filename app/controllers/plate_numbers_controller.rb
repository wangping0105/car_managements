class PlateNumbersController < ApplicationController
  def index
    @plant_numbers = PlateNumber.where(contact: current_cell.contacts).order(id: :desc).page(params[:page]).per(params[:per_page])
    @plant_numbers = @plant_numbers.where("plate_numbers.number like ?", "%#{params[:query]}%") if params[:query].present?

    @result =  current_cell.cell_contacts.joins(:contact).where(contact_id: @plant_numbers.map(&:contact_id)).
      pluck(:contact_id, 'contacts.name', 'contacts.phone', :cell_address)
  end

  def new
    @plant_numbers = PlateNumber.where(contact: current_cell.contacts).order(id: :desc).page(params[:page]).per(params[:per_page])
    @plant_numbers = @plant_numbers.where("plate_numbers.number like ?", "%#{params[:query]}%") if params[:query].present?

    @result =  current_cell.cell_contacts.joins(:contact).where(contact_id: @plant_numbers.map(&:contact_id)).
      pluck(:contact_id, 'contacts.name', 'contacts.phone', :cell_address)
  end

  def create
    PlateNumber.transaction do
      params[:phone] ||= params[:cell_address]
      @contact = Contact.find_by(phone: params[:phone])
      unless @contact.present?
        @contact = Contact.create(name: params[:name], phone: params[:phone])
        @cell_contact = @contact.cell_contacts.create(cell_id: params[:cell_id], cell_address: params[:cell_address])
      end

      @pn = PlateNumber.new(number: params[:number], contact: @contact)
      if @pn.save
        car_name =  "车#{params[:number]}#{params[:phone]}"
        @car = Car.create(name: car_name)
        @pn.update(car: @car)

        render json: { code: 0, msg: "保存成功", url: new_plate_numbers_path}
      else
        render json: { code: -1, msg: "保存失败, #{@pn.errors.full_messages.join(",")}"}

      end
    end
  end
end
