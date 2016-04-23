class MonstersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_monster, only: [:show, :edit, :update, :destroy]

  def index
    @monsters = current_user.monsters.sort_by(params)
    respond_to do |format|
      format.html
      format.json do
        render json: { monsters: @monsters }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: { monster: @monster }
      end
    end
  end

  def new
    @monster = current_user.monsters.new
    respond_to do |format|
      format.html
      format.json do
        render json: { monster: @monster }
      end
    end
  end

  def create
    @monster = current_user.monsters.new(monster_params)
    if @monster.save
      respond_to do |format|
        format.html do
          redirect_to monster_path(@monster), notice: 'Successfully created.'
        end
        format.json do
          render json: { monster: @monster }, status: :created
        end
      end
    else
      respond_to do |format|
        format.html do
          render :new
        end
        format.json do
          render json: { errors: @monster.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json do
        render json: { monster: @monster }
      end
    end
  end

  def update
    if @monster.update_attributes(monster_params)
      respond_to do |format|
        format.html do
          redirect_to monster_path(@monster), notice: 'Successfully updated'
        end
        format.json do
          render json: { monster: @monster }, status: :ok
        end
      end
    else
      respond_to do |format|
        format.html do
          render :edit
        end
        format.json do
          render json: { errors: @monster.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @monster.destroy
    respond_to do |format|
      format.html do
        redirect_to monsters_path, notice: 'Successfully deleted'
      end
      format.json do
        head :ok
      end
    end
  end

  protected

  def find_monster
    @monster = current_user.monsters.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :power, :monster_type_id)
  end
end
