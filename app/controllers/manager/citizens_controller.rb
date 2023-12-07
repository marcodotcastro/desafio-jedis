module Manager
  class CitizensController < InternalController
    before_action :set_citizen,
                  only: %i[show edit update
                           destroy]

    def index
      @q = Citizen.ransack(params[:q])
      @citizens = @q.result(distinct: true)
      @citizens = @citizens.order('created_at').page(params[:page]).per(4)
    end

    def show; end

    def new
      @citizen = Citizen.new
    end

    def edit; end

    def create
      @citizen = Citizen.new(citizen_params)
      respond_to do |format|
        if @citizen.save
          format.html do
            redirect_to manager_citizen_path(@citizen),
                        notice: t('controllers.manager.citizens.create')
          end
        else
          format.html do
            render :new,
                   status: :unprocessable_entity
          end
        end
      end
    end

    def update
      respond_to do |format|
        if @citizen.update(citizen_params)
          format.html do
            redirect_to manager_citizen_path(@citizen),
                        notice: t('controllers.manager.citizens.update')
          end
        else
          format.html do
            render :edit,
                   status: :unprocessable_entity
          end
        end
      end
    end

    private

    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    def citizen_params
      params.require(:citizen).permit(:full_name, :cns, :cpf, :email, :date_birth, :phone, :active, :photo)
    end
  end
end
