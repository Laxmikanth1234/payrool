class TimeSheetsController < ApplicationController
  # GET /time_sheets
  # GET /time_sheets.json
  def index
    @time_sheet = TimeSheet.last
    if @time_sheet.present?
      @holidays = Holiday.where(:month => @time_sheet.start_date.strftime("%m"),:year => @time_sheet.start_date.strftime("%Y"));
    end
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
    @time_sheet = TimeSheet.new(user_id: current_user.id,manager_id: current_user.manager_id, start_date: Date.today.beginning_of_month, end_date: Date.today.end_of_month, month: Date.today.strftime("%m"), year: Date.today.strftime("Y"),status: "New")
    logged_hours = []
    @holidays = Holiday.where(:month => Date.today.strftime("%m"),:year =>Date.today.strftime("%Y"))
    
    (Date.today.beginning_of_month..Date.today.end_of_month).select{|x| x}.each do |y|
      if (@holidays.collect{|x| x.day}.include? y.strftime("%d").to_i) && (y <= Date.today)
        logged_hours << 8
      else
        logged_hours << 0
      end
      
    end
    @time_sheet.logged_hours = logged_hours
    @time_sheet.save!
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
    
    puts "====================================#{params}"
    @time_sheet = TimeSheet.find(params[:id])

    respond_to do |format|
      if @time_sheet.update_attributes(params[:time_sheet])
        @time_sheet.logged_hours = params[:logged_hours]
        @time_sheet.save!
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
