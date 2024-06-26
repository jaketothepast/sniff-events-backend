class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_student, only: %i[ create ]
  before_action :set_assignment, only: %i[ create ]
  skip_before_action :verify_authenticity_token, only: %i[ create ]
  skip_before_action :require_login

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    # Get the assignment associated to the event
    student_assignment = StudentAssignment.find_by(student: @student, assignment: @assignment)
    @event = student_assignment.new_event(params[:event_type])
    # Format block to respond to.
    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
        @assignment.broadcast_replace_later_to 'student_assignments', partial: 'assignments/show_assignment'
      else
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_assignment
      @assignment = Assignment.find(params[:assignment_id])
    end

    def set_student
      puts params
      @student = Student.find(params[:student_id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:student_id, :assignment_id, :event)
    end
end
