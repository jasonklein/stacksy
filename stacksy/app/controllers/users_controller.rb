class UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result  
  end

  def search
    if params[:q]
      params[:q].delete :birthday_lteq if params[:q][:birthday_lteq].blank?
      params[:q].delete :birthday_gteq if params[:q][:birthday_gteq].blank?
    end

    if params[:q] && params[:q][:birthday_lteq] && params[:q][:birthday_gteq]
      reverse_age(params[:q][:birthday_lteq], params[:q][:birthday_gteq])
    end

    @q = User.ransack(params[:q])
    @users = @q.result

  end

  def home
    @users = User.all
    
  end

  def interests
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to user_home_path, notice: 'Your preferences were succesfully saved!'}
        format.json {head :no_content}
      else
        format.html{render action: "edit"}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
end


def reverse_age(min_age, max_age)
  min_age = min_age.to_i
  max_age = max_age.to_i

  #Minimum/Earliest birthday: Oldest Age
  min_now = Time.now.utc.to_date
  params[:q][:birthday_gteq] = min_now.change(:year => min_now.year - max_age)

  #Maximum/Latest birthday: Youngest Age
  max_now = Time.now.utc.to_date
  params[:q][:birthday_lteq] = max_now.change(:year => max_now.year - min_age)

end




end













