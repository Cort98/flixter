class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  def show
    
  end
  
  private
  
  def require_authorized_for_current_lesson
    unless current_user.enrolled_in?(current_lesson.section.course) or (current_lesson.section.course.user == current_user)
      redirect_to course_path(current_lesson.section.course), alert: 'You do not have access to that lesson'
    end
  end
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
