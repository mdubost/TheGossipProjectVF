class GossipController < ApplicationController

  def new
  end

  def create
      @gossip=Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: current_user.id)
      if @gossip.save
        @gossips=Gossip.all
        render 'index'
      else
        render 'new'
      end
  end

  def show
    @gossip=Gossip.find(params[:id])
    @user=User.find(@gossip.user_id)
    @comments=@gossip.comments
  end

  def index
    @gossips=Gossip.all
  end

end
