class PayrollsController < ApplicationController
  # GET /payrolls
  # GET /payrolls.json
  def index
    @payrolls = Payroll.all
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  
  def generate_payroll
    @employes = User
    if current_user.is_admin?
      @employes = @employes.where("id != ? ",current_user.id).all
    end
    if current_user.is_manager?
      @employes = @employes.where(:manager_id => current_user.id).where("id != ? ",current_user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /payrolls/1
  # GET /payrolls/1.json
  def show
    @payroll = Payroll.find(params[:id])
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.pdf { render :pdf => "#{@employe.name}",
                          :layout => false,
                          :orientation => 'landscape'
                }
    end
  end

  # GET /payrolls/new
  # GET /payrolls/new.json
  def new
    @payroll = Payroll.new
    @employe = User.find_by_id(params[:user_id])
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /payrolls/1/edit
  def edit
    @payroll = Payroll.find(params[:id])
    @employe = User.find_by_id(params[:user_id])
  end

  # POST /payrolls
  # POST /payrolls.json
  def create
    @employe = User.find_by_id(params[:user_id])
    @payroll = @employe.payrolls.new(params[:payroll])
    @payroll.calculate_salary(@employe.salary)
    respond_to do |format|
      if @payroll.save
        format.html { redirect_to [@employe, @payroll], notice: 'Payroll was successfully created.' }
      else
        format.html { redirect_to request.env['HTTP_REFERER'] }
      end
    end
  end

  # PUT /payrolls/1
  # PUT /payrolls/1.json
  def update
    @payroll = Payroll.find(params[:id])
    @employe = User.find_by_id(params[:user_id])
    @payroll.calculate_salary(@employe.salary)
    respond_to do |format|
      if @payroll.update_attributes(params[:payroll])
        format.html { redirect_to [@employe, @payroll], notice: 'Payroll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /payrolls/1
  # DELETE /payrolls/1.json
  def destroy
    @payroll = Payroll.find(params[:id])
    @payroll.destroy

    respond_to do |format|
      format.html { redirect_to payrolls_url }
    end
  end
end
