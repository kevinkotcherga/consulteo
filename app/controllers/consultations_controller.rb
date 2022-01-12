class ConsultationsController < ApplicationController
  def index
    @consultations = Consultation.all
  end

  def show
    @consultation = Consultation.find(params[:id])
  end

  def new
    @consultation = Consultation.new
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      redirect_to consultations_path(@consultation)
    else
      render :new
    end
  end

  def destroy
    @consultation = Consultation.find(params[:id])
    @consultation.destroy

    redirect_to root_path
  end

  def edit
    @doctors = Doctor.all
    @patients = Patient.all
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = Consultation.find(params[:id])
    @consultation.update(consultation_params)

    redirect_to consultation_path(@consultation)
  end

  private

  def consultation_params
    params.require(:consultation).permit(:name, :doctor_id, :patient_id)
  end
end
