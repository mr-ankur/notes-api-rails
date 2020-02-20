class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]
  swagger_controller :notes, "Notes Management"

  swagger_api :create do
   summary "To create note"
   notes "Implementation notes, such as required params, example queries for apis are written here."
   param :form, "note[user_id]", :integer, :required, "User id of note"
   param :form, "note[label]", :string, :required, "Label of note"
   param :form, "note[title]", :string, :required, "Title of note"
   param :form, "note[body]", :text, :required, "Body of note"
   param :form, "note[status]", :string, :optional, "Status of note"
   response :success
   response :unprocessable_entity
 end
 swagger_api :show do
   summary 'Get a notes'
   notes 'Should be used for fetching a note'
   param :path, :id, :integer, :id
   response :unauthorized
   response :not_found
   response :ok, "Success"
 end
 swagger_api :index do
      summary 'Get all the notes'
      notes 'Should be used for fetching all notes'
      param :header, :Authoraization, :string, :required, 'Authoraization'
      response :unauthorized
      response :ok, "Success"
end
 swagger_api :update do
       summary 'Edit the note'
       notes 'Should be used for editing a note'
       param :path, :id, :integer, :required, "Note Id"
       param :form, "note[user_id]", :integer, :required, "User id of note"
       param :form, "note[label]", :string, :required, "Label of note"
       param :form, "note[title]", :string, :required, "Title of note"
       param :form, "note[body]", :text, :required, "Body of note"
       param :form, "note[status]", :string, :optional, "Status of note"
       response :unauthorized
       response :not_found
       response :not_acceptable
  end
 swagger_api :destroy do
       summary 'Destroy the note'
       notes 'Should be used for destroying a note'
       param :path, :id, :string, :id
       response :unauthorized
       response :not_found
       response :ok, "Success"
  end

  # GET /api/v1/notes
  def index
    @notes = Note.all

    render json: @notes
  end

  # GET /api/v1/notes/1
  def show
    render json: @note
  end

  # note /api/v1/notes
  def create
    @note = Note.new(note_params)

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.require(:note).permit(:user_id,:body,:label,:title,:status,:note_id)
    end
end
