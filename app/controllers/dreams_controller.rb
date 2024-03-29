class DreamsController < ApplicationController
  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = Dream.order_by([['votes.up_count', :desc]]).paginate(:page => params[:page])

    respond_to do |format|
      format.html  # index.html.erb
      format.json { render json: @dreams }
    end
  end

  # GET /dreams/1
  # GET /dreams/1.json
  def show
    @dream = Dream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dream }
    end
  end

  def vote_up
    @dream = Dream.find(params[:dream_id])
    current_user.vote(@dream, :up)

    redirect_to dreams_path
  end

  def vote_down
    @dream = Dream.find(params[:dream_id])
    current_user.vote(@dream, :down)

    redirect_to dreams_path
  end

  def unvote
    @dream = Dream.find(params[:dream_id])
    current_user.unvote(@dream)

    redirect_to dreams_path
  end

  # GET /dreams/new
  # GET /dreams/new.json
  def new
    @dream = Dream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dream }
    end
  end

  # GET /dreams/1/edit
  def edit
    @dream = Dream.find(params[:id])
  end

  # POST /dreams
  # POST /dreams.json
  def create
    @dream = Dream.new(params[:dream])

    respond_to do |format|
      if @dream.save
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render json: @dream, status: :created, location: @dream }
      else
        format.html { render action: "new" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dreams/1
  # PUT /dreams/1.json
  def update
    @dream = Dream.find(params[:id])

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to @dream, notice: 'Dream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end
end
