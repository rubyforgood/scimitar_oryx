class Settings::SettingsController < ApplicationController
  before_filter :find_setting, :except => ['reorder', 'list']

  def list
    @page_title = "Settings"

    render 'settings/list'

  end
  
  def index
    @page_title = @setting.class.to_s.underscore.pluralize.titleize
    @body_id = 'settings'
    @settings = setting.all
    
    respond_to do |format|
      format.html do
        render :template => 'settings/index'
      end
    end
    
  end
  
  def reorder
    params[class_name.singularize].each_with_index do |id, position|
      setting.update_all({position: position + 1},{id: id})
    end
    render :nothing => true
  end
  
  def create
      if @setting.save
        render 'settings/create', layout: false, format: 'js'
      else
        render js: 'alert("Unable to save. Please verify it is not a duplicate.");'
      end
  end
  
  def edit
    render 'settings/edit', layout: false, format: 'js'
  end
  
  def update
    if @setting.update_attributes(params[class_name.singularize])
      render 'settings/update', layout: false, format: 'js'
    end
  end
  
  def destroy
    @setting.destroy
    render js: "$jq('##{dom_id(@setting)}').remove();"
  end
  
  def clone_ranks
    master_ranks_program_id = "0"
    @program = @setting
    @cloned_program = @school.programs.find(params[:cloned_program_id]) rescue nil

    flash[:notice] = "Unable to find program to copy ranks."
    unless @cloned_program.blank? && params[:cloned_program_id] != master_ranks_program_id
      flash[:notice] = "Unable to copy ranks."
      if @program.clone_ranks(@school, @cloned_program)
        flash[:notice] = nil
      end
    end
    redirect_to settings_program_ranks_path(@program)
  end
  
  private

  def find_setting
    @setting = case params[:action]
               when 'index' then setting.new
               when 'create' then setting.new(params[class_name.singularize])
               else setting.find(params[:id]) 
               end
    
    @setting
  end

  def setting
    class_name.singularize.titleize.gsub(/\s/,'').constantize    
  end
  
  def class_name
    uri_array = request.url.split('/')
    settings_index = uri_array.index('settings')
    return uri_array.at(settings_index.next)
  end
end