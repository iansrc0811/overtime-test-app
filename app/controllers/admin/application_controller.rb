# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin

  #設定Admin user 的type name, user type設定為陣列中的值就是admin user
  #之後若要新增user type 就可以在此新增，而不用寫死在程式碼 
  def self.admin_types 
    ['AdminUser']
  end

  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin


    def authenticate_admin
      unless Admin.admin_types.include?(current_user.try(:type)) 
      #用這個方法呼叫上面所寫的admin_types方法
      #而不用直接在這邊寫死admin type name
      #unless = if not
        flash[:alert] = "Your are not authorized to access this page"
        redirect_to(root_path)
      end
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
