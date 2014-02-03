class TimeSheetsController < ApplicationController
  # GET /time_sheets
  # GET /time_sheets.json
  def index
    @time_sheets = TimeSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_sheets }
    end
  end

  # GET /time_sheets/1
  # GET /time_sheets/1.json
  def show
    @time_sheet = TimeSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_sheet }
    end
  end

  # GET /time_sheets/new
  # GET /time_sheets/new.json
  def new
    @time_sheet = TimeSheet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_sheet }
    end
  end

  # GET /time_sheets/1/edit
  def edit
    @time_sheet = TimeSheet.find(params[:id])
  end

  # POST /time_sheets
  # POST /time_sheets.json
  def create
    @time_sheet = TimeSheet.new(params[:time_sheet])

    respond_to do |format|
      if @time_sheet.save
        format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully created.' }
        format.json { render json: @time_sheet, status: :created, location: @time_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_sheets/1
  # PUT /time_sheets/1.json
  def update
    @time_sheet = TimeSheet.find(params[:id])

    respond_to do |format|
      if @time_sheet.update_attributes(params[:time_sheet])
        format.html { redirect_to @time_sheet, notice: 'Time sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_sheets/1
  # DELETE /time_sheets/1.json
  def destroy
    @time_sheet = TimeSheet.find(params[:id])
    @time_sheet.destroy

    respond_to do |format|
      format.html { redirect_to time_sheets_url }
      format.json { head :no_content }
    end
  end
end