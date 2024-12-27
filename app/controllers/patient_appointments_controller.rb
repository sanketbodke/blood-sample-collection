class PatientAppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [ :edit, :update, :destroy ]


  def index
    @appointments = current_user.patientAppointments.includes(:agent)
  end

  def new
    @appointment = current_user.patientAppointments.build
    @agents = Agent.all
  end

  def create
    @appointment = current_user.patientAppointments.build(appointment_params)

    AppointmentMailer.appointment_scheduled(@appointment).deliver_now

    if @appointment.save
      redirect_to patient_appointments_path, notice: "Appointment scheduled successfully."
    else
      flash[:alert] = "Error scheduling appointment"
      render :new
    end
  end

  def edit
    @agents = Agent.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointments_path, notice: "Appointment updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to patient_appointments_path, notice: "Appointment cancelled."
  end

  private

  def set_appointment
    @appointment = current_user.patientAppointments.find(params[:id])
  end

  def appointment_params
    params.require(:patient_appointment).permit(:agent_id, :appointment_time, :test_type, :collection_location, :note)
  end
end
