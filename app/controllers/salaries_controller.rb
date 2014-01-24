class SalariesController < ApplicationController
  # GET /salaries
  # GET /salaries.json
  def index
    @salaries = Salary.all
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /salaries/1
  # GET /salaries/1.json
  def show
    @salary = Salary.find(params[:id])
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /salaries/new
  # GET /salaries/new.json
  def new
    @salary = Salary.new
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /salaries/1/edit
  def edit
    @salary = Salary.find(params[:id])
    @employe = User.find_by_id(params[:user_id])
  end

  # POST /salaries
  # POST /salaries.json
  def create
    @employe = User.find_by_id(params[:user_id])
    @employe.salaries.each do |s|
      s.active=0
      s.save!
    end
    @salary = @employe.salaries.new(params[:salary])

    respond_to do |format|
      if @salary.save
        format.html { redirect_to edit_employe_path(@employe), notice: 'Salary was successfully created.' }
      else
        format.html { redirect_to request.env['HTTP_REFERER'] }
      end
    end
  end

  # PUT /salaries/1
  # PUT /salaries/1.json
  def update
    @salary = Salary.find(params[:id])

    respond_to do |format|
      if @salary.update_attributes(params[:salary])
        format.html { redirect_to @salary, notice: 'Salary was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /salaries/1
  # DELETE /salaries/1.json
  def destroy
    @salary = Salary.find(params[:id])
    @salary.destroy

    respond_to do |format|
      format.html { redirect_to salaries_url }
    end
  end
end
