class Admin::StatesController < Admin::BaseController

  def index
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(params[:state])

    if @state.save
      redirect_to admin_states_path, notice: "State has been successfully created."
    else
      render action: :new, alert: "State has not been created."
    end
  end

  def make_default
    @state = State.find(params[:id])
    @state.default!

    flash[:notice] = "#{@state.name} is now the default state."
    redirect_to admin_states_path
  end
end
