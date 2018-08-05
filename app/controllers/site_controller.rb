class SiteController < ApplicationController
  def about
  end

  def contact
  end

  def home
  end
  
  def thanks
    @match= Match.find(params[:id])
    @package = Package.find(@match.packageID_id)
    @package.update_attribute(:status, "Paid with paypal")
  end
end
