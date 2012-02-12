class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role?     :admin
                        can :manage, :all

    elsif user.role? :uploader
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Comment, Gallery, Photo]
                        can :update, [Gallery, Photo] do |p|
                          p.try(:user) == user
                        end
                        can :destroy, [Gallery, Photo] do |p|
                          p.try(:user) == user
                        end

    elsif user.role? :author
                        can :read, :all
                        cannot :manage, :all
                        can :create, [Comment, Post]
                        can :update, Post do |p|
                          p.try(:user) == user
                        end
                        can :destroy, Post do |p|
                          p.try(:user) == user
                        end
    
    elsif user.role? :commenter
                        can :read, :all
                        cannot :manage, :all
                        can :create, Comment
                        can :update, Comment do |c|
                          c.try(:user) == user
                        end
                        can :destroy, Comment do |c|
                          c.try(:user) == user
                        end
    
    else              # guest
                        can :read, :all
                        cannot :manage, :all
                        can :show, [Gallery, Post]
    end
  end
end
