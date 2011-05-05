module Models
  module User
    module RolMethods
      extend ActiveSupport::Concern

      included do
      end

      module ClassMethods
        def has_roles(*roles)
          roles.each do |rol|
            define_method "#{rol}?" do
              self.rol == rol.to_s
            end
          end
        end
      end

      module InstanceMethods
      end
    end
  end
end