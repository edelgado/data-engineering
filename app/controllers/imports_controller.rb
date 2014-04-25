class ImportsController < ApplicationController
  def upload
    @file_upload = Import.new
  end

  def parse
    @file_upload = Import.new(import_params['import'])
    if @file_upload.save
      flash[:notice] = 'Cool'
    else
      render action: 'upload'
    end
  end

  private
    def import_params
      params.permit(import: [:file])
    end
end
