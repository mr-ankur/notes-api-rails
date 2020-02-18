class Api::V1::NotesController < ApplicationController
  before_action :set_api_v1_note, only: [:show, :update, :destroy]

  # GET /api/v1/notes
  def index
    @api_v1_notes = Note.all

    render json: @api_v1_notes
  end

  # GET /api/v1/notes/1
  def show
    render json: @api_v1_note
  end

  # POST /api/v1/notes
  def create
    @api_v1_note = Note.new(api_v1_note_params)

    if @api_v1_note.save
      render json: @api_v1_note, status: :created, location: @api_v1_note
    else
      render json: @api_v1_note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/notes/1
  def update
    if @api_v1_note.update(api_v1_note_params)
      render json: @api_v1_note
    else
      render json: @api_v1_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/notes/1
  def destroy
    @api_v1_note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_note
      @api_v1_note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_note_params
      raise params.to_yaml
      # params.fetch(:api_v1_note, {})
      p "=============================="
      p "=============================="
      p "=============================="
      p params
      p "=============================="
      p "=============================="
      p "=============================="
      p "=============================="
      # params.require(:note).permit(:type,:description,:status)
    end
end
