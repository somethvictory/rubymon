class MonsterTeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_monster_team, only: [:show, :edit, :update, :destroy]

  def index
    @monster_teams = current_user.monster_teams
    respond_to do |format|
      format.html
      format.json do
        render json: { monster_teams: @monster_teams }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: { monster_team: @monster_team }
      end
    end
  end

  def new
    @monster_team = current_user.monster_teams.new
    respond_to do |format|
      format.html
      format.json do
        render json: { monster_team: @monster_team }
      end
    end
  end

  def create
    @monster_team = current_user.monster_teams.new(monster_team_params)
    if @monster_team.save
      respond_to do |format|
        format.html do
          redirect_to monster_team_path(@monster_team), notice: 'Successfully created.'
        end
        format.json do
          render json: { monster_team: @monster_team }, status: :created
        end
      end
    else
      respond_to do |format|
        format.html do
          render :new
        end
        format.json do
          render json: { errors: @monster_team.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json do
        render json: { monster_team: @monster_team }
      end
    end
  end

  def update
    if @monster_team.update_attributes(monster_team_params)
      respond_to do |format|
        format.html do
          redirect_to monster_team_path(@monster_team), notice: 'Successfully updated'
        end
        format.json do
          render json: { monster_team: @monster_team }, status: :ok
        end
      end
    else
      respond_to do |format|
        format.html do
          render :edit
        end
        format.json do
          render json: { errors: @monster_team.errors }, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @monster_team.destroy
    respond_to do |format|
      format.html do
        redirect_to monster_teams_path, notice: 'Successfully deleted'
      end
      format.json do
        head :ok
      end
    end
  end

  protected

  def find_monster_team
    @monster_team = current_user.monster_teams.find(params[:id])
  end

  def monster_team_params
    params.require(:monster_team).permit(:name, monster_ids: [])
  end
end
