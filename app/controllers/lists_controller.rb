class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :load_lists, only: [:index]
  before_action :load_filtered_lists, only: [:filtered_index]
  before_action :load_ordered_lists, only: [:index, :filtered_index]

  include ListsHelper
    def index
      if params[:search]
        @lists = List.where("number::text ILIKE ?", "#{params[:search]}%")
      end
    end

    def filtered_index
      if params[:search]
        @lists = List.where("number < 30").where("number::text ILIKE ?", "#{params[:search]}%")
      end
    end

  private
    def load_lists
      @lists = List.all
    end

    def load_filtered_lists

      @lists = List.where("number < 30")
    end

    def load_ordered_lists
      @lists = @lists.order(number: :asc)
    end

 # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        then
        format.html { redirect_to list_url(@list), notice: "contact was added to directory" }
        format.json { render :show, status: :created, location: @list }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to list_url(@list), notice: "contact was updated to directory." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy


    @list = List.find(params[:id])
    @list.destroy
      format.html { redirect_to lists_url, notice: "contact was deleted." }
      format.json { head :no_content }

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:name, :number, :email)
    end
  end
