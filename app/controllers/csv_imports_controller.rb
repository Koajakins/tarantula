class CsvImportsController < ApplicationController
  layout false
  
  def new
  end

  def create
    # TODO: see that stuff isn't imported to wrong project
    import = CsvExchange::Import.new(params[:file], params[:simulate])
    import.process
    @log = import.log
    render :template => '/import/log'
  end
end
