class MinimalAdminScaffoldGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  def create_controller_files
    template 'controllers/controller.rb.erb', File.join('app/controllers/admin', class_path, "#{plural_table_name}_controller.rb")
  end

  def create_view_files
    %w(index edit show new _form).each do |view|
      template "views/#{view}.html.erb.erb", File.join('app/views/admin', plural_table_name, "#{view}.html.erb")
    end
  end
end
