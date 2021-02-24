class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show 
    @board = Board.find_by(id: params[:id])
  end

  def new 
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path, notice: "已新增看板！"
    else
      render :new
    end
  end


  def edit
    @board = Board.find_by(id: params[:id])
  end

  def update
    @board = Board.find_by(id: params[:id])
    if @board.update(board_params)
      redirect_to boards_path, notice: "看板已更新！"
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    @board.destroy
    redirect_to boards_path, notice: "看板已刪除！"
  end
private
  def board_params
    params.require(:board).permit(:title)
  end
end
