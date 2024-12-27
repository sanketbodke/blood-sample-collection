class PatientSamplesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [ :edit, :update ]

  def index
    @agents = current_user.lab.agents
    @appointments = PatientAppointment.where(agent_id: @agents.pluck(:id))
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_samples_path, notice: "Appointment status updated successfully."
    else
      flash[:alert] = "Error updating status"
      render :edit
    end
  end

  private

  def set_appointment
    @appointment = PatientAppointment.find(params[:id])
  end
  def appointment_params
    params.require(:patient_appointment).permit(:status)
  end
end
