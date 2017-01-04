class PlateNumbersController < ApplicationController
  before_action :set_plant_number, only:[ :edit, :update, :destroy]

  def index
    @plant_numbers = PlateNumber.where(contact: current_cell.contacts).order(id: :desc).page(params[:page]).per(params[:per_page])
    @plant_numbers = @plant_numbers.where("plate_numbers.number like ?", "%#{params[:query]}%") if params[:query].present?

    @result =  current_cell.cell_contacts.joins(:contact).where(contact_id: @plant_numbers.map(&:contact_id)).
      select(:contact_id, 'contacts.name', 'contacts.phone', :cell_address)
  end

  def new
    @plant_numbers = PlateNumber.where(contact: current_cell.contacts).order(id: :desc).page(params[:page]).per(params[:per_page])
    @plant_numbers = @plant_numbers.where("plate_numbers.number like ?", "%#{params[:query]}%") if params[:query].present?

    @result =  current_cell.cell_contacts.joins(:contact).where(contact_id: @plant_numbers.map(&:contact_id)).
      select(:contact_id, 'contacts.name', 'contacts.phone', :cell_address)
  end

  def edit
    @result = current_cell.cell_contacts.joins(:contact).where(contact_id: @plant_number.contact_id).
      select('contacts.name', 'contacts.phone', :cell_address).first
  end

  def create
    PlateNumber.transaction do
      params[:phone] ||= params[:cell_address]
      @contact = Contact.find_by(phone: params[:phone])
      unless @contact.present?
        @contact = Contact.create(name: params[:name], phone: params[:phone])
        @cell_contact = @contact.cell_contacts.create(cell_id: params[:cell_id], cell_address: params[:cell_address])
      end

      @plant_number = PlateNumber.new(number: params[:number], contact: @contact)
      if @plant_number.save
        car_name =  "车#{params[:number]}#{params[:phone]}"
        @car = Car.create(name: car_name)
        @plant_number.update(car: @car)

        render json: { code: 0, msg: "保存成功", url: new_plate_number_path}
      else
        render json: { code: -1, msg: "保存失败, #{@plant_number.errors.full_messages.join(",")}"}
      end
    end
  end

  def update
    PlateNumber.transaction do
      @plant_number = PlateNumber.find(params[:id])
      params[:phone] ||= params[:cell_address]
      @contact = @plant_number.contact
      @cell_contact = @contact.cell_contacts.find_by(cell_id: current_cell.id)
      if @contact.update(name: params[:name], phone: params[:phone]) && @cell_contact
        @cell_contact.update(cell_address: params[:cell_address])
      end

      if @plant_number.update(number: params[:number])
        render json: { code: 0, msg: "保存成功", url: plate_numbers_path}
      else
        render json: { code: -1, msg: "保存失败, #{@plant_number.errors.full_messages.join(",")}"}
      end
    end
  end

  def destroy
    @plant_number.destroy

    redirect_to root_path(page: params[:page])
  end

  private
  def set_plant_number
    @plant_number ||= PlateNumber.find(params[:id])
  end
end
