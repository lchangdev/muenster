class CompaniesController < ActionController::Base
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    # if company is saved redirect to company's page
    if @company.save
      flash[:notice] = "Success"

      redirect_to companies_path
    else
      flash[:notice] = "Did not save try again"
      render :new
      # render is not a completely new page and keeps the params from the previous
    end
  end

  def edit
    @company = Company.find(param[:id])
  end

  # hand in hand with the edit method
  def update
    @comapny = Company.find(param[:id])
    if @company.update(company_params)
      flash[:notice] = "Success"

      redirect_to companies_path
    else
      flash[:notice] = "Did not save try again"
      render :new
      # render is not a completely new page and keeps the params from the previous
    end
  end

  private
  # makes it only for internal use

  def company_params
    # :company is the key to access the values
    # :company do not want anyone to teach anything except for company and white list what the user can touch
    params.require(:company).permit(:name, :description, :industry, :website, :location)
  end
end
