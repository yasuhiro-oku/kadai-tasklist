class ApplicationController < ActionController::Base
    def index
    if logged_in?
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.microposts.order(id: :desc).page(params[:page])
    end
    end
    private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_tasks = user.tasks.count
  end
end
