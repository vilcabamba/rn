module Admin
  module Breadcrumbs
    extend ActiveSupport::Concern

    included do
      mattr_accessor :resource_name
      mattr_accessor :resource_ancestor
    end

    module ClassMethods
      def resource(resource_name, options={})
        self.resource_name = resource_name
        self.resource_ancestor = options[:ancestor]
      end
    end

    ##
    # Adds breadcrumbs for each action.
    # Calls breadcrumbs for #index by default
    def add_breadcrumbs
      breadcrumb_for "index" # base

      if action_name != "index"
        breadcrumb_for action_name
      end
    end

    ##
    # @return [String] base name (singular)
    #   based on controller's name by default
    def breadcrumb_base
      controller_name.singularize
    end

    def breadcrumbs_plural
      breadcrumb_base.pluralize
    end

    ##
    # @return [String] base path to
    #   generate links
    def breadcrumbs_base_path
      breadcrumb_base
    end

    def ancestor_prefix
      "#{resource_ancestor}_" if resource_ancestor.present?
    end

    ##
    # @param action [String] name of the action
    #   to render breadcrumbs for
    def breadcrumb_for(action)
      # define breadcrumb_for_action for custom
      if respond_to?("breadcrumb_for_#{action}", true)
        send("breadcrumb_for_#{action}")
        return
      end

      case action
      when "index"
        add_breadcrumb(
          t(
            "activerecord.models.#{breadcrumb_base}"
          ).pluralize,
          send("admin_#{ancestor_prefix}#{breadcrumbs_base_path.pluralize}_path")
        )
      when "new"
        add_breadcrumb(
          t(
            "views.#{breadcrumbs_plural}.new"
          ),
          send("new_admin_#{ancestor_prefix}#{breadcrumbs_base_path}_path")
        )
      when "create"
        breadcrumb_for "new"
      when "show"
        add_breadcrumb(
          send(resource_name),
          send("admin_#{ancestor_prefix}#{breadcrumbs_base_path}_path", id: send(resource_name).id)
        )
      when "edit"
        breadcrumb_for "show"

        add_breadcrumb(
          t("views.#{breadcrumb_base.pluralize}.edit"),
          send("edit_admin_#{ancestor_prefix}#{breadcrumbs_base_path}_path")
        )
      when "update"
        breadcrumb_for "edit"
      end
    end
  end
end
