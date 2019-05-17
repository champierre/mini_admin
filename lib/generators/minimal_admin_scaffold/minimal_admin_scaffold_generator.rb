class MinimalAdminScaffoldGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('templates', __dir__)

  class_option :orm, banner: "NAME", type: :string, required: true,
               desc: "ORM to generate the controller for"

  argument :attributes, type: :array, default: [], banner: "field:type field:type"

  hook_for :resource_route, in: :rails do |resource_route|
    invoke resource_route, [prefixed_class_name]
  end

  def create_controller_files
    template 'controllers/admin_controller.rb.erb', 'app/controllers/admin_controller.rb'
    template 'controllers/controller.rb.erb', File.join('app/controllers/admin', class_path, "#{plural_table_name}_controller.rb")
  end

  def create_view_files
    %w(index edit show new _form).each do |view|
      template "views/#{view}.html.erb.erb", File.join('app/views/admin', plural_table_name, "#{view}.html.erb")
    end
  end

  protected
  def prefix
    'admin'
  end

  def prefixed_class_name
    "#{prefix.capitalize}::#{class_name}"
  end

  def prefixed_controller_class_name
    "#{prefix.capitalize}::#{controller_class_name}"
  end

  def prefixed_plain_model_url
    "#{prefix}_#{singular_table_name}"
  end

  def prefixed_index_helper
    "#{prefix}_#{index_helper}"
  end

  def model_columns_for_attributes
    class_name.constantize.columns.reject do |column|
      column.name.to_s =~ /^(id|created_at|updated_at)$/
    end
  end

  def attributes
    model_columns_for_attributes.map do |column|
      Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
    end
  end
end
