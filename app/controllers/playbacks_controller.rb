class PlaybacksController < ApplicationController
  before_action :set_playback, only: [:show, :edit, :update, :destroy]

  # GET /playbacks
  def index
    if @playbacks.present?
      redirect_to @playbacks.first
    else
      redirect_to new_playback_path
    end
  end

  # GET /playbacks/1
  # GET /playbacks/1.json
  def show
  end

  # GET /playbacks/new
  def new
    @playback = Playback.new
  end

  # GET /playbacks/1/edit
  def edit
  end

  # POST /playbacks
  # POST /playbacks.json
  def create
    @playback = Playback.new(playback_params)

    respond_to do |format|
      if @playback.save
        format.html { redirect_to @playback, notice: 'Playback was successfully created.' }
        format.json { render :show, status: :created, location: @playback }
      else
        format.html { render :new }
        format.json { render json: @playback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playbacks/1
  # PATCH/PUT /playbacks/1.json
  def update
    respond_to do |format|
      if @playback.update(playback_params)
        # format.html { redirect_to @playback, notice: 'Playback was successfully updated.' }
        format.json { render :show, status: :ok, location: @playback }
        # format.js { redirect_to @playbacks.last }
      else
        format.html { render :edit }
        format.json { render json: @playback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playbacks/1
  # DELETE /playbacks/1.json
  def destroy
    @playback.destroy
    respond_to do |format|
      format.html { redirect_to playbacks_url, notice: 'Playback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playback
      @playback = Playback.find(params[:id])
      open("#{Rails.root}/public/gesture.json.lz", 'wb') do |file|
        file.write @playback.data
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playback_params

      params.require(:playback).permit(:name, :data)
    end
end
