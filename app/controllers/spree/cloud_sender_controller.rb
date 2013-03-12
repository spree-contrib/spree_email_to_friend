class Spree::CloudSenderController < Spree::BaseController
  require 'rubygems'
  
  include Spree::Core::ControllerHelpers::Order
          
  def importGmail    
    client = HTTPClient.new
    body = { 'service' => params[:service], 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password], 'referrer' => 'sweet_spree' }
    response = client.post('https://api.cloudsponge.com/begin_import/user_consent.json', body)
    data = ActiveSupport::JSON.decode(response.body)
    @authURL = data["url"]
    @importID = data["import_id"]
    
    respond_to do | format |
      format.html {render :layout => false}
    end
  end
  
  def importAOL
    client = HTTPClient.new
    body = { 'service' => params[:service], 'username' => params[:username], 'password' => params[:password], 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password], 'referrer' => 'sweet_spree' }
    response = client.post('https://api.cloudsponge.com/begin_import/import.json', body)
    data = ActiveSupport::JSON.decode(response.body)
    @importID = data["import_id"]
    
    respond_to do | format |
      format.html {render :layout => false}
    end
  end
  
  def importOutlook
    client = HTTPClient.new
    body = { 'service' => 'OUTLOOK', 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password], 'referrer' => 'sweet_spree' }
    response = client.post('https://api.cloudsponge.com/begin_import/desktop_applet.json', body)
    data = ActiveSupport::JSON.decode(response.body)
    @authURL = data["url"]
    @importID = data["import_id"]
    
    respond_to do | format |
      format.html {render :layout => false}
    end
  end
  
  def importOSX
    client = HTTPClient.new
    body = { 'service' => 'ADDRESSBOOK', 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password], 'referrer' => 'sweet_spree' }
    response = client.post('https://api.cloudsponge.com/begin_import/desktop_applet.json', body)
    data = ActiveSupport::JSON.decode(response.body)
    @authURL = data["url"]
    @importID = data["import_id"]
    
    respond_to do | format |
      format.html {render :layout => false}
    end
  end
  
  def importCheck
    @success = false;
    
    client = HTTPClient.new
    body = { 'import_id' => params[:id], 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password] }
    response = client.get('https://api.cloudsponge.com/events/' + params[:id], body)
    @data = ActiveSupport::JSON.decode(response.body)
    if (@data["events"].count > 0)
      if ((@data["events"][0]["event_type"] == "COMPLETE") && (@data["events"][0]["status"] == "COMPLETED"))
        @success = "true"
      elsif ((@data["events"][0]["event_type"] == "COMPLETE") && (@data["events"][0]["status"] == "ERROR"))
        @success = "error"
      else
        @success = "false"
      end
    end
    
    respond_to do | format |
      format.html {render :layout => false}
    end
  end
    
  def importContacts
    client = HTTPClient.new
    body = { 'import_id' => params[:id], 'domain_key' => Spree::Cloudsponge::Config[:domain_key], 'domain_password' => Spree::Cloudsponge::Config[:domain_password] }
    response = client.get('https://api.cloudsponge.com/contacts/' + params[:id], body)
    @data = ActiveSupport::JSON.decode(response.body)
    @contacts_with_dups = @data["contacts"].sort {|x,y| x["first_name"].capitalize <=> y["first_name"].capitalize}
    @contacts = Array.new
    emailList = Array.new
    @contacts_with_dups.each do |contact|
      if !(contact["email"].nil?) && !(contact["email"][0].nil?) && !(contact["email"][0]["address"].nil?) && (contact["email"][0]["address"] != "")
        if !(emailList.include?(contact["email"][0]["address"]))
          emailList << contact["email"][0]["address"]
          @contacts << contact
        end
      end
    end    

    respond_to do | format |
      format.html {render :layout => false}
    end
  end
  
  def cloudsponge_proxy
    importer = Cloudsponge::ContactImporter.new(Spree::Cloudsponge::Config[:domain_key], Spree::Cloudsponge::Config[:domain_password])
    url = Cloudsponge::URL_BASE + 'auth?' + request.query_string

    response = if request.post?
      Cloudsponge::Utility::post_url(url, request.parameters)
    elsif request.get?
      Cloudsponge::Utility::get_url(url)
    else
      nil
    end

    if response.is_a?(Net::HTTPRedirection)
      redirect_to response["location"]
    else
      render :text => response.try(:body)
    end
  end
  
  private
  
    def find_object
      class_name = "Spree::#{(params[:type].titleize)}".constantize
      return false if params[:id].blank?
      @object = class_name.find_by_id(params[:id])
      if class_name.respond_to?('find_by_permalink')
        @object ||= class_name.find_by_permalink(params[:id])
      end
      if class_name.respond_to?('get_by_param')
        @object ||= class_name.get_by_param(params[:id])
      end
      # Display 404 page if object is not found.
      raise ActiveRecord::RecordNotFound if @object.nil?
    end
end
