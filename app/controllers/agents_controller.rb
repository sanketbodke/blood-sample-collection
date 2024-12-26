class AgentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agent, only: [ :edit, :update, :destroy ]
  def index
    @agents = current_user.lab.agents.includes(:address).recently_updated
  end

  def new
    @agent = current_user.lab.agents.build
    @agent.build_address
  end

  def create
    @agent = current_user.lab.agents.build(agent_params)

    if @agent.save
      redirect_to agents_path, notice: "Agent created successfully."
    else
      flash[:alert] = "Error creating agent"
      render :new
    end
  end

  def edit
  end

  def update
    if @agent.update(agent_params)
      redirect_to agents_path, notice: "Agent successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @agent.destroy
    redirect_to agents_path, notice: "Agent deleted successfully."
  end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end

  def agent_params
    params.require(:agent).permit(:name, :phone, :email, address_attributes: [ :street, :city, :state, :zip ])
  end
end
