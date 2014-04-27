class ImportsController < ApplicationController
  def upload
    @file_upload = Import.new
  end

  def parse
    @file_upload = Import.new(import_params['import'])
    if @file_upload.save
      @file_upload.process_file
      @total_gross_revenue = Transaction.total_gross_revenue(@file_upload.id)
      @cumulative_total_gross_revenue = Transaction.total_gross_revenue
      @clients = Client.all.to_a
      @merchants = Merchant.all.to_a
    else
      render action: 'upload'
    end
  end

  def start_over
    Client.destroy_all
    Merchant.destroy_all
    Transaction.destroy_all
    Import.destroy_all
    flash['warning'] = "The DB has been cleared."
    redirect_to action: 'upload'
  end

  private
  def import_params
    params.permit(import: [:file])
  end
end